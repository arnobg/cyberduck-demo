# Generic variables
region = "us-east-1"

# VPC variables
vpc_name             = "demo-vpc"
vpc_cidr             = "10.0.0.0/16"
vpc_azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_public_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
vpc_private_subnets  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
vpc_database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
vpc_tags             = { "created-by" = "terraform" }

# ASG variables

web_asg_sg_name                             = "web-asg-sg"
web_asg_sg_description                      = "web-asg-sg"
web_asg_sg_tags                             = { "Name" = "web-asg-sg", "created-by" = "terraform" }
web_asg_name                                = "web-asg"
web_asg_min_size                            = 0
web_asg_max_size                            = 3
web_asg_desired_capacity                    = 3
web_asg_wait_for_capacity_timeout           = 0
web_asg_health_check_type                   = "EC2"
web_asg_launch_template_name                = "web-lt"
web_asg_launch_template_description         = "web-lt"
web_asg_update_default_version              = true
web_asg_image_id                            = "ami-0aa7d40eeae50c9a9"
web_asg_instance_type                       = "t3.micro"
web_asg_ebs_optimized                       = true
web_asg_enable_monitoring                   = true
web_asg_create_iam_instance_profile         = true
web_asg_iam_role_name                       = "web-asg-iam-role"
web_asg_iam_role_path                       = "/ec2/"
web_asg_iam_role_description                = "web-asg-iam-role"
web_asg_iam_role_tags                       = { "Name" = "web-asg-iam-role", "created-by" = "terraform" }
web_asg_block_device_mappings_volume_size_0 = 20
web_asg_block_device_mappings_volume_size_1 = 30
web_asg_instance_tags                       = { "Name" = "web-asg-instance", "created-by" = "terraform" }
web_asg_volume_tags                         = { "Name" = "web-asg-volume", "created-by" = "terraform" }
web_asg_tags                                = { "Name" = "web-asg", "created-by" = "terraform" }


app_asg_sg_name                             = "app-asg-sg"
app_asg_sg_description                      = "app-asg-sg"
app_asg_sg_tags                             = { "Name" = "app-asg-sg", "created-by" = "terraform" }
app_asg_name                                = "app-asg"
app_asg_min_size                            = 0
app_asg_max_size                            = 3
app_asg_desired_capacity                    = 3
app_asg_wait_for_capacity_timeout           = 0
app_asg_health_check_type                   = "EC2"
app_asg_launch_template_name                = "app-lt"
app_asg_launch_template_description         = "app-lt"
app_asg_update_default_version              = true
app_asg_image_id                            = "ami-0aa7d40eeae50c9a9"
app_asg_instance_type                       = "t3.micro"
app_asg_ebs_optimized                       = true
app_asg_enable_monitoring                   = true
app_asg_create_iam_instance_profile         = true
app_asg_iam_role_name                       = "app-asg-iam-role"
app_asg_iam_role_path                       = "/ec2/"
app_asg_iam_role_description                = "app-asg-iam-role"
app_asg_iam_role_tags                       = { "Name" = "app-asg-iam-role", "created-by" = "terraform" }
app_asg_block_device_mappings_volume_size_0 = 20
app_asg_block_device_mappings_volume_size_1 = 30
app_asg_instance_tags                       = { "Name" = "app-asg-instance", "created-by" = "terraform" }
app_asg_volume_tags                         = { "Name" = "app-asg-volume", "created-by" = "terraform" }
app_asg_tags                                = { "Name" = "app-asg", "created-by" = "terraform" }


# ALB variables

web_alb_sg_name                    = "web-alb-sg"
web_alb_sg_ingress_cidr_blocks     = ["0.0.0.0/0"]
web_alb_sg_description             = "web-alb-sg"
web_alb_sg_tags                    = { "Name" = "web-alb-sg", "created-by" = "terraform" }
web_alb_name                       = "web-alb"
web_alb_http_tcp_listeners_port    = 80
web_alb_target_group_name          = "web-alb-tg"
web_alb_target_groups_backend_port = 80
web_alb_tags                       = { "Name" = "web-alb", "created-by" = "terraform" }

alb_sg_name                    = "app-alb-sg"
alb_sg_description             = "app-alb-sg"
alb_sg_tags                    = { "Name" = "app-alb-sg", "created-by" = "terraform" }
alb_name                       = "app-alb"
alb_http_tcp_listeners_port    = 80
alb_target_group_name          = "app-alb-tg"
alb_target_groups_backend_port = 80
alb_tags                       = { "Name" = "app-alb", "created-by" = "terraform" }

# RDS variables

rds_sg_name                         = "aurora-rds-sg"
rds_sg_description                  = "aurora-rds-sg"
rds_sg_tags                         = { "Name" = "aurora-rds-sg", "created-by" = "terraform" }
aurora_mysql_engine                 = "aurora-mysql"
rds_engine_version                  = "5.7.mysql_aurora.2.10.1"
rds_instance_class                  = "db.t3.small"
rds_db_name                         = "auroradb"
rds_username                        = "master"
rds_port                            = 3306
rds_enabled_cloudwatch_logs_exports = ["general"]
rds_tags                            = { "Name" = "aurora-rds", "created-by" = "terraform" }
rds_db_instance_tags                = { "Name" = "aurora-rds-instance", "created-by" = "terraform" }