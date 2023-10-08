set -l instance_name $(aws ec2 describe-instances | jq '.Reservations' | jq -r '.[].Instances | .[0].Tags | .[] | select(.Key == "Name") | .Value' | fzf)
set -l instance_id $(aws ec2 describe-instances --filters 'Name=tag:Name,Values='$instance_name | jq -r '.Reservations | .[0].Instances | .[0].InstanceId')

aws ssm start-session --target $instance_id
