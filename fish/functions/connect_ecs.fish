function connect_ecs
    set -l CLUSTER_NAME genai-agentassist-cluster
    set -l SERVICE_FILTER GenAI
    set -l LOCAL_PORT 8000
    set -l REMOTE_PORT 8000

    echo -n "🔍 Getting bastion host instance ID... "
    set -l BASTION_INSTANCE_ID (aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=AgentAssist-Bastion" "Name=instance-state-name,Values=running" \
        --query "Reservations[*].Instances[*].InstanceId" \
        --output text)

    if test -z "$BASTION_INSTANCE_ID"
        echo "❌ Failed"
        echo "   No running bastion instance found."
        return 1
    else
        echo -e "\r✅ Got bastion host instance ID: $BASTION_INSTANCE_ID"
    end

    echo -n "🔍 Getting ECS task private IP... "
    set -l ECS_TASK_IP (aws ecs list-services \
        --cluster $CLUSTER_NAME \
        --query "serviceArns[?contains(@, '$SERVICE_FILTER')]" \
        --output text | xargs -n1 -I{} aws ecs list-tasks \
            --cluster $CLUSTER_NAME \
            --service-name {} \
            --query "taskArns[0]" \
            --output text | xargs -n1 -I{} aws ecs describe-tasks \
                --cluster $CLUSTER_NAME \
                --tasks {} \
                --query "tasks[0].attachments[0].details[?name=='privateIPv4Address'].value" \
                --output text)

    if test -z "$ECS_TASK_IP"
        echo "❌ Failed"
        echo "   Could not find ECS task IP."
        return 1
    else
        echo -e "\r✅ Got ECS task IP: $ECS_TASK_IP"
    end

    echo "🚀 Starting port forwarding from localhost:$LOCAL_PORT to $ECS_TASK_IP:$REMOTE_PORT..."
    aws ssm start-session \
        --target $BASTION_INSTANCE_ID \
        --document-name AWS-StartPortForwardingSessionToRemoteHost \
        --parameters "{\"host\":[\"$ECS_TASK_IP\"],\"portNumber\":[\"$REMOTE_PORT\"],\"localPortNumber\":[\"$LOCAL_PORT\"]}"
end
