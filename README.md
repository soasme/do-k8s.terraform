Copy and edit terraform variables:

    cp terraform.tfvars.sample terraform.tfvars

Init Terraform:

    brew install terraform
    terraform init

Check plan:

    terraform plan

Execute plan:

    terraform apply

Create ansible environment:

    python3 -mvenv venv
    source venv/bin/activate
    pip3 install -r requirements.txt

Edit cluster info:

    cp -rfp inventory/sample inventory/kube-cluster
    vi inventory/kube-cluster/host.ini # define inventory information. todo: automate this in 01-provision-ansible.tf, [k8s-cluster:vars] ansible_ssh_user=core, ansible_become=true, ansible_python_interpreter="/opt/bin/python"
    vi inventory/kube-cluster/group_vars/all.yml # bootstrap_os=coreos; 
    vi inventory/kube-cluster/group_vars/k8s-cluster.yml # flannel, resolvconf_mode: host_resolvconf, 

Run:

    ANSIBLE_CONFIG=./kubespray/ansible.cfg ANSIBLE_NOCOWS=1 ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i kubespray/inventory/kube-cluster/hosts.ini kubespray/cluster.yml
