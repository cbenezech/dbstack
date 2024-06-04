# Create Images
cd amis
source variables
packer build -only=base packer.json && packer build -except=base packer.json

# Create Graveline infrastructure
cd ../terraform/environment/production/graveline
terragrunt run-all apply -auto-approve