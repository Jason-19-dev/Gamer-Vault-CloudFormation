#!/bin/bash

set -e

# Config
REGION="us-east-1"
PROFILE="default"
ACCOUNT_ID=$(aws sts get-caller-identity --profile $PROFILE --query Account --output text)

VPC_ID=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" --output text --profile $PROFILE)
PRIVATE_SUBNET=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet'].OutputValue" --output text --profile $PROFILE)
AURORA_SG_ID=$(aws cloudformation describe-stacks --stack-name gamer-db --query "Stacks[0].Outputs[?OutputKey=='AuroraSg'].OutputValue" --output text --profile $PROFILE)
NLB_SG=$(aws cloudformation describe-stacks --stack-name gamer-vpc --query "Stacks[0].Outputs[?OutputKey=='NlbSecurityGroupId'].OutputValue" --output text --profile $PROFILE)

#Crear stack de ec2
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


