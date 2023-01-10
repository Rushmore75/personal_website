# This requires you to have an ssh key set up, otherwise it will be asking
# you for passwords and annoying things.

echo "Make sure you ran 'hugo' to generate the site after you made changes"

echo "REMOTE="$REMOTE
echo "CONTAINER_NAME="$CONTAINER_NAME

scp -r public root@$REMOTE:/

# This runs commands on the remote host
ssh root@$REMOTE << EOF
	docker cp /public $CONTAINER_NAME:/usr/src/website/
EOF
