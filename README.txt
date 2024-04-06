


aws ecs execute-command  \
    --region us-east-2 \
    --cluster fragile-cluster \
    --task bb72734046164681bf4b2cec286c00c6 \
    --container demmitv \
    --command "/bin/bash" \
    --interactive \
    --profile ecs_driver_1

aws ecs describe-services \
  --cluster fragile-cluster \
  --services demmitv \
  --profile ecs_driver_1

aws ecs list-tasks \
  --cluster fragile-cluster \
  --service demmitv \
  --profile ecs_driver_1

aws ecs describe-tasks --cluster fragile-cluster \
  --tasks arn:aws:ecs:us-east-2:831556125887:task/fragile-cluster/6653805b531c463eb6e6e9d13424ae93 \
  --profile ecs_driver_1

