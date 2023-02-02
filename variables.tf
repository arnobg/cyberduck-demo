# Generic variables
variable "region" {
  description = "Region code"
  type        = string
  default     = "us-east-1"
}

# VPC variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "demo-vpc"
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "List of AZs"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_public_subnets" {
  description = "List of public subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "vpc_private_subnets" {
  description = "List of private subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_database_subnets" {
  description = "List of database subnet CIDR ranges"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
}

variable "vpc_tags" {
  description = "Tags to apply to vpc peering for api x data vpc"
  type        = map(string)
  default     = { "Name" = "demo-vpc", "created-by" = "terraform" }
}

# ASG variables

variable "web_asg_sg_name" {
  description = "Name of the frontend autoscaling group security group"
  type        = string
  default     = "web-asg-sg"
}

variable "web_asg_sg_description" {
  description = "Description of the frontend autoscaling group security group"
  type        = string
  default     = "web-asg-sg"
}

variable "web_asg_sg_tags" {
  description = "Tags for frontend autoscaling group security group"
  type        = map(string)
  default     = { "Name" = "web-asg-sg", "created-by" = "terraform" }
}


variable "app_asg_sg_name" {
  description = "Name of the frontend autoscaling group security group"
  type        = string
  default     = "app-asg-sg"
}

variable "app_asg_sg_description" {
  description = "Description of the frontend autoscaling group security group"
  type        = string
  default     = "app-asg-sg"
}

variable "app_asg_sg_tags" {
  description = "Tags for frontend autoscaling group security group"
  type        = map(string)
  default     = { "Name" = "app-asg-sg", "created-by" = "terraform" }
}

variable "web_asg_name" {
  description = "Name of the frontend autoscaling group"
  type        = string
  default     = "web-asg"
}

variable "web_asg_min_size" {
  description = "Frontend Auto scaling minimum size"
  type        = number
  default     = 0
}

variable "web_asg_max_size" {
  description = "Frontend Auto scaling maximum size"
  type        = number
  default     = 1
}

variable "web_asg_desired_capacity" {
  description = "Frontend Auto scaling desired capacity"
  type        = number
  default     = 1
}

variable "web_asg_wait_for_capacity_timeout" {
  description = "Frontend Auto scaling wait for capacity timeout"
  type        = number
  default     = 0
}

variable "web_asg_health_check_type" {
  description = "Frontend Auto scaling health check type"
  type        = string
  default     = "EC2"
}

variable "web_asg_launch_template_name" {
  description = "Name of the frontend autoscaling group launch template"
  type        = string
  default     = "web-lt"
}

variable "web_asg_launch_template_description" {
  description = "Description of the frontend autoscaling group security group"
  type        = string
  default     = "web-lt"
}

variable "web_asg_update_default_version" {
  description = "Frontend Auto scaling group update default version"
  type        = bool
  default     = true
}

variable "web_asg_image_id" {
  description = "Frontend Auto scaling group image id"
  type        = string
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "web_asg_instance_type" {
  description = "Frontend Auto scaling group instance type"
  type        = string
  default     = "t3.micro"
}

variable "web_asg_ebs_optimized" {
  description = "Frontend Auto scaling group ebs optimized"
  type        = bool
  default     = true
}

variable "web_asg_enable_monitoring" {
  description = "Frontend Auto scaling group enable monitoring"
  type        = bool
  default     = true
}

variable "web_asg_create_iam_instance_profile" {
  description = "Frontend Auto scaling group create iam instance profile"
  type        = bool
  default     = true
}

variable "web_asg_iam_role_name" {
  description = "Frontend Auto scaling group iam role name"
  type        = string
  default     = "web-asg-iam-role"
}

variable "web_asg_iam_role_path" {
  description = "Frontend Auto scaling group iam role path"
  type        = string
  default     = "/ec2/"
}

variable "web_asg_iam_role_description" {
  description = "Frontend Auto scaling group iam role description"
  type        = string
  default     = "web-asg-iam-role"
}

variable "web_asg_iam_role_tags" {
  description = "Frontend Auto scaling group iam role tags"
  type        = map(string)
  default     = { "Name" = "web-asg-iam-role", "created-by" = "terraform" }
}

variable "web_asg_block_device_mappings_volume_size_0" {
  description = "Frontend Auto scaling group block device mapping volume size 0"
  type        = number
  default     = 20
}

variable "web_asg_block_device_mappings_volume_size_1" {
  description = "Frontend Auto scaling group block device mapping volume size 1"
  type        = number
  default     = 30
}

variable "web_asg_instance_tags" {
  description = "Frontend Auto scaling group instance tags"
  type        = map(string)
  default     = { "Name" = "web-asg-instance", "created-by" = "terraform" }
}

variable "web_asg_volume_tags" {
  description = "Frontend Auto scaling group volume tags"
  type        = map(string)
  default     = { "Name" = "web-asg-volume", "created-by" = "terraform" }
}

variable "web_asg_tags" {
  description = "Frontend Auto scaling group tags"
  type        = map(string)
  default     = { "Name" = "web-asg", "created-by" = "terraform" }
}


variable "app_asg_name" {
  description = "Name of the backend autoscaling group"
  type        = string
  default     = "app-asg"
}

variable "app_asg_min_size" {
  description = "Backend Auto scaling minimum size"
  type        = number
  default     = 0
}

variable "app_asg_max_size" {
  description = "Backend Auto scaling maximum size"
  type        = number
  default     = 1
}

variable "app_asg_desired_capacity" {
  description = "Backend Auto scaling desired capacity"
  type        = number
  default     = 1
}

variable "app_asg_wait_for_capacity_timeout" {
  description = "Backend Auto scaling wait for capacity timeout"
  type        = number
  default     = 0
}

variable "app_asg_health_check_type" {
  description = "Backend Auto scaling health check type"
  type        = string
  default     = "EC2"
}

variable "app_asg_launch_template_name" {
  description = "Name of the backend autoscaling group launch template"
  type        = string
  default     = "app-lt"
}

variable "app_asg_launch_template_description" {
  description = "Description of the backend autoscaling group security group"
  type        = string
  default     = "app-lt"
}

variable "app_asg_update_default_version" {
  description = "Backend Auto scaling group update default version"
  type        = bool
  default     = true
}

variable "app_asg_image_id" {
  description = "Backend Auto scaling group image id"
  type        = string
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "app_asg_instance_type" {
  description = "Backend Auto scaling group instance type"
  type        = string
  default     = "t3.micro"
}

variable "app_asg_ebs_optimized" {
  description = "Backend Auto scaling group ebs optimized"
  type        = bool
  default     = true
}

variable "app_asg_enable_monitoring" {
  description = "Backend Auto scaling group enable monitoring"
  type        = bool
  default     = true
}

variable "app_asg_create_iam_instance_profile" {
  description = "Backend Auto scaling group create iam instance profile"
  type        = bool
  default     = true
}

variable "app_asg_iam_role_name" {
  description = "Backend Auto scaling group iam role name"
  type        = string
  default     = "web-asg-iam-role"
}

variable "app_asg_iam_role_path" {
  description = "Backend Auto scaling group iam role path"
  type        = string
  default     = "/ec2/"
}

variable "app_asg_iam_role_description" {
  description = "Backend Auto scaling group iam role description"
  type        = string
  default     = "app-asg-iam-role"
}

variable "app_asg_iam_role_tags" {
  description = "Backend Auto scaling group iam role tags"
  type        = map(string)
  default     = { "Name" = "app-asg-iam-role", "created-by" = "terraform" }
}

variable "app_asg_block_device_mappings_volume_size_0" {
  description = "Backend Auto scaling group block device mapping volume size 0"
  type        = number
  default     = 20
}

variable "app_asg_block_device_mappings_volume_size_1" {
  description = "Backend Auto scaling group block device mapping volume size 1"
  type        = number
  default     = 30
}

variable "app_asg_instance_tags" {
  description = "Backend Auto scaling group instance tags"
  type        = map(string)
  default     = { "Name" = "app-asg-instance", "created-by" = "terraform" }
}

variable "app_asg_volume_tags" {
  description = "Backend Auto scaling group volume tags"
  type        = map(string)
  default     = { "Name" = "app-asg-volume", "created-by" = "terraform" }
}

variable "app_asg_tags" {
  description = "Backend Auto scaling group tags"
  type        = map(string)
  default     = { "Name" = "app-asg", "created-by" = "terraform" }
}



# ALB variables

variable "web_alb_sg_name" {
  description = "Frontend application load balancer security group name"
  type        = string
  default     = "web-alb-sg"
}

variable "web_alb_sg_ingress_cidr_blocks" {
  description = "Frontend Application load balancer cidr blocks"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "web_alb_sg_description" {
  description = "Frontend Application load balancer security group description"
  type        = string
  default     = "web-alb-sg"
}

variable "web_alb_sg_tags" {
  description = "Frontend Application load balancer security group tags"
  type        = map(string)
  default     = { "Name" = "web-alb-sg", "created-by" = "terraform" }
}

variable "web_alb_description" {
  description = "Frontend Application load balancer description"
  type        = string
  default     = "web-alb"
}

variable "web_alb_name" {
  description = "Frontend Application load balancer name"
  type        = string
  default     = "web-alb"
}

variable "web_alb_http_tcp_listeners_port" {
  description = "Frontend Application load balancer http listeners port"
  type        = number
  default     = 80
}

variable "web_alb_target_group_name" {
  description = "Frontend Application load balancer target group name"
  type        = string
  default     = "web-alb-tg"
}

variable "web_alb_target_groups_backend_port" {
  description = "Frontend Application load balancer http listeners port"
  type        = number
  default     = 80
}

variable "web_alb_tags" {
  description = "Frontend Application load balancer tags"
  type        = map(string)
  default     = { "Name" = "web-alb", "created-by" = "terraform" }
}


variable "alb_sg_name" {
  description = "Backend application load balancer security group name"
  type        = string
  default     = "app-alb-sg"
}

/*
variable "alb_sg_ingress_cidr_blocks" {
  description = "Backend Application load balancer cidr blocks"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}
*/

variable "alb_sg_description" {
  description = "Backend Application load balancer security group description"
  type        = string
  default     = "app-alb-sg"
}

variable "alb_sg_tags" {
  description = "Backend Application load balancer security group tags"
  type        = map(string)
  default     = { "Name" = "app-alb-sg", "created-by" = "terraform" }
}

variable "alb_description" {
  description = "Backend Application load balancer description"
  type        = string
  default     = "app-alb"
}

variable "alb_name" {
  description = "Backend Application load balancer name"
  type        = string
  default     = "app-alb"
}

variable "alb_http_tcp_listeners_port" {
  description = "Backend Application load balancer http listeners port"
  type        = number
  default     = 80
}

variable "alb_target_group_name" {
  description = "Backend Application load balancer target group name"
  type        = string
  default     = "app-alb-tg"
}

variable "alb_target_groups_backend_port" {
  description = "Backend Application load balancer http listeners port"
  type        = number
  default     = 80
}

variable "alb_tags" {
  description = "Application load balancer tags"
  type        = map(string)
  default     = { "Name" = "app-alb", "created-by" = "terraform" }
}

# RDS variables

variable "rds_sg_name" {
  description = "Aurora database service security group name"
  type        = string
  default     = "aurora-rds-sg"
}

variable "rds_sg_description" {
  description = "Aurora database service security group description"
  type        = string
  default     = "aurora-rds-sg"
}

variable "rds_sg_tags" {
  description = "Aurora database service security group tags"
  type        = map(string)
  default     = { "Name" = "aurora-rds-sg", "created-by" = "terraform" }
}

variable "rds_instance_count" {
  description = "Aurora RDS instance count"
  type        = number
  default     = 3
}

variable "aurora_mysql_engine" {
  description = "Aurora database service mysql engine"
  type        = string
  default     = "aurora-mysql"
}

variable "rds_engine_version" {
  description = "Aurora database service mysql engine version"
  type        = string
  default     = "5.7.mysql_aurora.2.10.1"
}

variable "rds_azs" {
  description = "List of AZs"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


variable "rds_instance_class" {
  description = "Aurora database instance class"
  type        = string
  default     = "db.t3.small"
}

variable "rds_db_name" {
  description = "Aurora database service db name"
  type        = string
  default     = "auroradb"
}

variable "rds_username" {
  description = "Aurora database service username"
  type        = string
  default     = "master"
}

variable "rds_password" {}

variable "rds_port" {
  description = "Aurora database service port"
  type        = number
  default     = 3306
}

variable "rds_enabled_cloudwatch_logs_exports" {
  description = "Aurora database service enabled cloudwatch log exports"
  type        = list(any)
  default     = ["general"]
}

variable "rds_tags" {
  description = "Aurora database service tags"
  type        = map(string)
  default     = { "Name" = "aurora-rds", "created-by" = "terraform" }
}

variable "rds_db_instance_tags" {
  description = "Aurora database service db instance tags"
  type        = map(string)
  default     = { "Name" = "aurora-rds", "created-by" = "terraform" }
}
