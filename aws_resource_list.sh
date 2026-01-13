#!/bin/bash

###############################################################

# This script will list all the resources in the aws account
# Author : Pavani/DevOps Team
# version : v0.0.1
#
# Following are the supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. ELB
# 8. CloudFront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. CloudFormation
# 15. IAM
#
# Usage : ./aws_resource_list.sh <region> <service_name>
# Example : ./aws_resource_list.sh us-east-1 EC2

# Project Reference(AWS CLI Command Reference) : https://docs.aws.amazon.com/cli/latest/

################################################################

# Check if the required number of arguments are passed 
if [ $# -ne 2 ]; then # $# --> no. of arguments
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

echo "region: $1"
echo "service_name: $2"


# Check if the AWS CLI is installed or not
if ! aws --version &> /dev/null; then # &> /dev/null --> &> /dev/null redirects both normal output (stdout) and error messages (stderr) of a command to nowhere (/dev/null --> think of as black hole), so nothing is displayed on the screen.
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
else 
    echo "AWS CLI is installed."
fi


# Check if AWS CLI is configured
if ! aws sts get-caller-identity &> /dev/null; then 
    echo "AWS CLI is not configured. Please configure it and try again."
    exit 1
else 
    echo "AWS CLI is configured."
fi

# List the resources based on the service
case $2 in
    ec2)
        echo "Listing EC2 Instances in $1"
        aws ec2 describe-instances --region $1
        ;;
    rds)
        echo "Listing RDS Instances in $1"
        aws rds describe-db-instances --region $1
        ;;
    s3)
        echo "Listing S3 Buckets in $1"
        aws s3api list-buckets --region $1
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $1"
        aws cloudfront list-distributions --region $1
        ;;
    vpc)
        echo "Listing VPCs in $1"
        aws ec2 describe-vpcs --region $1
        ;;
    iam)
        echo "Listing IAM Users in $1"
        aws iam list-users --region $1
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $1"
        aws route53 list-hosted-zones --region $1
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $1"
        aws cloudwatch describe-alarms --region $1
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $1"
        aws cloudformation describe-stacks --region $1
        ;;
    lambda)
        echo "Listing Lambda Functions in $1"
        aws lambda list-functions --region $1
        ;;
    sns)
        echo "Listing SNS Topics in $1"
        aws sns list-topics --region $1
        ;;
    sqs)
        echo "Listing SQS Queues in $1"
        aws sqs list-queues --region $1
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $1"
        aws dynamodb list-tables --region $1
        ;;
    ebs)
        echo "Listing EBS Volumes in $1"
        aws ec2 describe-volumes --region $1
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
