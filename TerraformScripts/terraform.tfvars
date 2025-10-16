region = "ap-south-1"
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24",
  "10.0.14.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c"
]

destination_cidr_block = "0.0.0.0/0"

cluster_name = "lost-found-cluster"
node_desired_size = 3
node_min_size = 3
node_max_size = 5
instance_type = "t3.medium"
key_name = "Harini-Ansible-Key"
ami_id_linux = "ami-0f4e66c71c8504ac2"
ami_id_ubuntu = "ami-02d26659fd82cf299"
instance_types = {
  bastion   = "t2.micro"
  jenkins   = "t3.medium"
  sonarqube = "t3.medium"
}
tags = {
  Environment = "Dev"
  Project     = "lost-found"
  Owner       = "Harini"
}