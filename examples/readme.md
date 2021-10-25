# AWSCLI Installation

## steps for latest awscli on linux and macos

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

unzip awscli-bundle.zip

sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws


## verify aws version
 
 aws --version
 
 
 ## configure the environment 
 
aws configure

AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE

AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

Default region name [None]: us-west-2

Default output format [None]: json


## Access key ID and secret access key

To create access keys for an IAM user

Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.

In the navigation pane, choose Users.

Choose the name of the user whose access keys you want to create, and then choose the Security credentials tab.

In the Access keys section, choose Create access key.

To view the new access key pair, choose Show. You will not have access to the secret access key again after this dialog box closes. Your credentials will look something like this:

Access key ID: AKIAIOSFODNN7EXAMPLE

Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

To download the key pair, choose Download .csv file. Store the keys in a secure location. You will not have access to the secret access key again after this dialog box closes.

Keep the keys confidential in order to protect your AWS account and never email them. Do not share them outside your organization, even if an inquiry appears to come from AWS or Amazon.com. No one who legitimately represents Amazon will ever ask you for your secret key.

After you download the .csv file, choose Close. When you create an access key, the key pair is active by default, and you can use the pair right away.

