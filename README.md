# Gamer-Vault-CloudFormation

#  reenvío de puertos en AWS Systems Manager Session Manager para conectarse a hosts remotos 
## Ejemplo con una Aurora RDS
```bash 
aws ssm start-session --target i-02ebe5b97d6f466c2 --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters '{"portNumber":["3306"],"host":["database-1-instance-1.c4t864a8kdls.us-east-1.rds.amazonaws.com"] ,"localPortNumber":["8400"]}' --region us-east-1
```
```
-target :Id del EC2
..
```
