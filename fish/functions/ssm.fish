function ssm --description "Attach to an available EC2 instance"

    set -l instance_name $(aws ec2 describe-instances | jq '.Reservations' | jq -r '.[].Instances | .[0].Tags | .[] | select(.Key == "Name") | .Value' | fzf)

    if test -z "$instance_name"
        echo "No instance selected. Aborting."
        return 1 # Indicate failure
    end

    set -l instance_id $(aws ec2 describe-instances --filters 'Name=tag:Name,Values='$instance_name | jq -r '.Reservations | .[0].Instances | .[0].InstanceId')

    echo "Selected instance: $instance_name"

    if test -z "$instance_id"
        echo "Error: Could not find Instance ID for '$instance_name' or it's not running. Aborting."
        aws ec2 describe-instances --filters "Name=tag:Name,Values=$instance_name" # Show details for debugging
        return 1 # Indicate failure
    end

    echo "Found Instance ID: $instance_id"
    echo "Starting SSM session..."

    aws ssm start-session --target $instance_id

    set -l last_status $status
    return $last_status

end
