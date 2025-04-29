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
PUBLIC_SUBNETS=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='PublicSubnets'].OutputValue" --output text --profile $PROFILE)
PRIVATE_SUBNET=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet'].OutputValue" --output text --profile $PROFILE)

PRIVATE_SUBNETS=$(echo $SUBNETS | tr -d ' ')
echo "🔍 SubnetIds usados: $PRIVATE_SUBNETS"

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
    SubnetIds=$PRIVATE_SUBNETS


AURORA_SG_ID=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='AuroraSg'].OutputValue" --output text --profile $PROFILE)

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
    SubnetIds=$PRIVATE_SUBNETS \
    NlbSecurityGroupId=$NLB_SG

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
    SubnetIds=$PRIVATE_SUBNETS \
    FargateSecurityGroupId=$FARGATE_SG

# 5. Crear stack de ec2
echo "Creando stack: ec2"
aws cloudformation deploy \
  --stack-name gamer-ec2 \
  --template-file private-ec2-ssm.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION \
  --profile $PROFILE \
  --parameter-overrides \
    VpcId=$VPC_ID \
    SubnetId=$PRIVATE_SUBNET \
    AuroraSecurityGroupId=$AURORA_SG_ID \
    NlbSecurityGroupId=$NLB_SG

echo "Despliegue completado correctamente"