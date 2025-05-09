#!/bin/bash

set -e

# Config
REGION="us-east-1"
PROFILE="default"
ACCOUNT_ID=$(aws sts get-caller-identity --profile $PROFILE --query Account --output text)

VPC_ID=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" --output text --profile $PROFILE)
SUBNETS=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnets'].OutputValue" --output text --profile $PROFILE)
FARGATE_SG=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='FargateSecurityGroupId'].OutputValue" --output text --profile $PROFILE)
NLB_SG=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='NlbSecurityGroupId'].OutputValue" --output text --profile $PROFILE)
PRIVATE_SUBNETS=$(echo $SUBNETS | tr -d ' ')

AURORA_SECRET_ARN=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='SecretArn'].OutputValue" --output text --profile $PROFILE)
AURORA_HOST=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='ClusterEndpoint'].OutputValue" --output text --profile $PROFILE)

TARGET_GROUP_ARN_AUTH=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='TargetGroupArnAuth'].OutputValue" --output text --profile $PROFILE)
TARGET_GROUP_ARN_ORDER=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='TargetGroupArnOrder'].OutputValue" --output text --profile $PROFILE)
TARGET_GROUP_ARN_PRODUCT=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='TargetGroupArnProduct'].OutputValue" --output text --profile $PROFILE)
TARGET_GROUP_ARN_WALLET=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='TargetGroupArnWallet'].OutputValue" --output text --profile $PROFILE)

NLB_DNS=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='NlbDnsName'].OutputValue" --output text --profile $PROFILE)
NLB_ARN=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='NlbArn'].OutputValue" --output text --profile $PROFILE)

# 6. Deploy ECS Fargate
echo "Creando stack: ECS Fargate"
aws cloudformation deploy \
  --stack-name gamer-fargate \
  --template-file ecs-fargate.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE \
  --parameter-overrides \
    VpcId=$VPC_ID \
    PrivateSubnets=$PRIVATE_SUBNETS \
    TargetGroupArnAuth=$TARGET_GROUP_ARN_AUTH \
    TargetGroupArnOrder=$TARGET_GROUP_ARN_ORDER \
    TargetGroupArnProduct=$TARGET_GROUP_ARN_PRODUCT \
    TargetGroupArnWallet=$TARGET_GROUP_ARN_WALLET \
    FargateSecurityGroupId=$FARGATE_SG \
    AuthContainerImage=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/auth-api:latest \
    OrdersContainerImage=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/orders-api:latest \
    ProductsContainerImage=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/products-api:latest \
    WalletContainerImage=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/wallet-api:latest \
    AuroraSecretArn=$AURORA_SECRET_ARN \
    AuroraHost=$AURORA_HOST

# 7. Lambda Authorizer
echo "Creando stack: Lambda Authorizer"
aws cloudformation deploy \
  --stack-name gamer-lambda-auth\
  --template-file lambda-authorizer.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE

LAMBDA_AUTH_ARN=$(aws cloudformation describe-stacks --stack-name gamer-lambda-auth --query "Stacks[0].Outputs[?OutputKey=='AuthorizerLambdaArn'].OutputValue" --output text --profile $PROFILE)

# 8. API Gateway + VPC Link
echo "Creando stack: API Gateway + VPC Link"
aws cloudformation deploy \
  --stack-name gamer-apigateway \
  --template-file apigateway-vpclink.yaml \
  --region $REGION \
  --profile $PROFILE \
  --parameter-overrides \
    NlbDns=$NLB_DNS \
    NlbArn=$NLB_ARN \
    AuthorizerLambdaArn=$LAMBDA_AUTH_ARN

echo "Despliegue completado correctamente"