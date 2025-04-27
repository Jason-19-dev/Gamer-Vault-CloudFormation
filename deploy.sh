#!/bin/bash

set -e

# Config
REGION="us-east-1"
PROFILE="default"
ACCOUNT_ID=$(aws sts get-caller-identity --profile $PROFILE --query Account --output text)

# 1. Crear stack de red
echo "Creando stack: red"
aws cloudformation deploy \
  --stack-name gamer-vpc \
  --template-file vpc-network.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE

# Obtener valores de salida
VPC_ID=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" --output text --profile $PROFILE)
SUBNETS=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnets'].OutputValue" --output text --profile $PROFILE)
FARGATE_SG=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='FargateSecurityGroupId'].OutputValue" --output text --profile $PROFILE)
NLB_SG=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='NlbSecurityGroupId'].OutputValue" --output text --profile $PROFILE)

SUBNET_LIST=$(echo $SUBNETS | tr -d ' ')
echo "🔍 SubnetIds usados: $SUBNET_LIST"

# 2. Crear Aurora MySQL
echo "Creando stack: Aurora MySQL"
aws cloudformation deploy \
  --stack-name gamer-db \
  --template-file aurora-mysql.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE \
  --parameter-overrides \
    VpcId=$VPC_ID \
    SubnetIds="$SUBNET_LIST"

AURORA_SECRET_ARN=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='SecretArn'].OutputValue" --output text --profile $PROFILE)
AURORA_HOST=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='ClusterEndpoint'].OutputValue" --output text --profile $PROFILE)

# 3. Crear NLB
echo "Creando stack: NLB"
aws cloudformation deploy \
  --stack-name gamer-nlb \
  --template-file nlb.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE \
  --parameter-overrides \
    VpcId=$VPC_ID \
    SubnetIds="$SUBNET_LIST" \
    NlbSecurityGroupId=$NLB_SG

TARGET_GROUP_ARN=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='TargetGroupArn'].OutputValue" --output text --profile $PROFILE)
NLB_ARN=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='NlbArn'].OutputValue" --output text --profile $PROFILE)
NLB_LISTENER_ARN=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='NlbListenerArn'].OutputValue" --output text --profile $PROFILE)
NLB_DNS=$(aws cloudformation describe-stacks --stack-name gamer-nlb --query "Stacks[0].Outputs[?OutputKey=='NlbDnsName'].OutputValue" --output text --profile $PROFILE)

# 4. Crear VPC Endpoints para ECR
echo "Creando stack: VPC Endpoints para ECR"
aws cloudformation deploy \
  --stack-name gamer-vpc-endpoints \
  --template-file vpc-endpoints.yaml \
  --region $REGION \
  --profile $PROFILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    VpcId=$VPC_ID \
    SubnetIds=$SUBNET_LIST \
    FargateSecurityGroupId=$FARGATE_SG

# 5. Crear subnets publicas para Fargate (temporal)
echo "Creando stack: Public Subnets"
aws cloudformation deploy \
  --stack-name gamer-public-subnets \
  --template-file public-subnets.yaml \
  --region $REGION \
  --profile $PROFILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    VpcId=$VPC_ID

PUBLIC_SUBNETS=$(aws cloudformation describe-stacks \
  --stack-name gamer-public-subnets \
  --region $REGION \
  --profile $PROFILE \
  --query "Stacks[0].Outputs[?OutputKey=='PublicSubnets'].OutputValue" \
  --output text)

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
    PrivateSubnets=$PUBLIC_SUBNETS \
    TargetGroupArn=$TARGET_GROUP_ARN \
    FargateSecurityGroupId=$FARGATE_SG \
    ContainerImage=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/demo-app:latest \
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