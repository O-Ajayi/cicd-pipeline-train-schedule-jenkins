#!/bin/bash
echo "Running this from the bash script"

CURRENT_DIR=$(pwd)
INPUT="${CURRENT_DIR}$1"
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read -r key value
do
	echo "Testing"
	echo "Key : $key"
	echo "Value : $value"

	aws ssm put-parameter \
	    --name "${key}" \
	    --value "${value}" \
	    --type "SecureString" \
	    --overwrite 
	    # --no-cli-pager

done < $INPUT
# IFS=$OLDIFS

echo "End of ssm deployment"


# #!/bin/bash

# sudo yum update –y
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum upgrade
# sudo dnf install java-11-amazon-corretto -y
# sudo yum install jenkins -y
# sudo systemctl enable jenkins
# sudo systemctl start jenkins
# sudo systemctl status jenkins