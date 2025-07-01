# SSH Agent Setup
eval $(ssh-agent) > /dev/null 2>&1
find ~/.ssh -type f -name "*.pem" -o -name "*.key" -exec ssh-add {} > /dev/null 2>&1 \;
