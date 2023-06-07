#!/bin/bash
echo "Running this from the bash script"
echo $1
CURRENT_DIR=$(pwd)
INPUT="${CURRENT_DIR}$1"
echo $INPUT
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