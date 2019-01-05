sudo snap install multipass --beta --classic
wget https://bit.ly/2tOfMUA -O kubeflow.init
multipass launch bionic -n kubeflow -m 8G -d 40G -c 4 --cloud-init kubeflow.init
multipass mount . kubeflow:/multipass
multipass shell kubeflow # login into vm
echo "export GITHUB_TOKEN=$1" > /multipass/github-token.txt
source /multipass/github-token.txt   # exports your github token
/kubeflow/install-kubeflow.sh        # waits until all pods are “running”; prints the port