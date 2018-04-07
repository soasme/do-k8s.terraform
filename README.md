cp terraform.tfvars.sample terraform.tfvars
python3 -mvenv venv
source venv/bin/activate
pip3 install -r requirements.txt
brew install terraform
terraform init
terraform plan
terraform apply
ANSIBLE_CONFIG=./kubespray/ansible.cfg ANSIBLE_NOCOWS=1 ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i kubespray/inventory/kube-cluster/hosts.ini kubespray/cluster.yml
