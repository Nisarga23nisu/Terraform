# Terraform



    
https://cloudchamp.notion.site/Terraform-Scenario-based-Interview-Questions-bce29cb359b243b4a1ab3191418bfaab#6b01ef96628b45799cec6ad0e563eb97

https://github.com/daws-78s/real-interview-questions/blob/main/terraform.MD


# Installation of Terraform
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt-get update
sudo apt-get install -y terraform

terraform -version
