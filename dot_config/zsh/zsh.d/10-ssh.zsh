# SSH Agent Setup
eval $(ssh-agent) > /dev/null 2>&1
for key in ~/.ssh/*.pem
do
    ssh-add "$key" > /dev/null 2>&1
done
