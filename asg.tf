
################################################################################
# Supporting Resources
################################################################################

module "web_asg_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = var.web_asg_sg_name
  description = var.web_asg_sg_description
  vpc_id      = module.vpc.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = "${aws_security_group.web_alb_sg.id}"
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]

  tags = var.web_asg_sg_tags
}

module "app_asg_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = var.app_asg_sg_name
  description = var.app_asg_sg_description
  vpc_id      = module.vpc.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = "${aws_security_group.app_alb_sg.id}"
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]

  tags = var.app_asg_sg_tags
}

################################################################################
# Autoscaling scaling group (ASG)
################################################################################

# ASG for Frontend Web Servers

module "web-asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = var.web_asg_name

  min_size                  = var.web_asg_min_size
  max_size                  = var.web_asg_max_size
  desired_capacity          = var.web_asg_desired_capacity
  wait_for_capacity_timeout = var.web_asg_wait_for_capacity_timeout
  health_check_type         = var.web_asg_health_check_type
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = module.web-alb.target_group_arns

  # Launch template
  launch_template_name        = var.web_asg_launch_template_name
  launch_template_description = var.web_asg_launch_template_description
  update_default_version      = var.web_asg_update_default_version

  image_id          = var.web_asg_image_id
  instance_type     = var.web_asg_instance_type
  ebs_optimized     = var.web_asg_ebs_optimized
  enable_monitoring = var.web_asg_enable_monitoring

  # IAM role & instance profile
  create_iam_instance_profile = var.web_asg_create_iam_instance_profile
  iam_role_name               = var.web_asg_iam_role_name
  iam_role_path               = var.web_asg_iam_role_path
  iam_role_description        = var.web_asg_iam_role_description
  iam_role_tags               = var.web_asg_iam_role_tags
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.web_asg_block_device_mappings_volume_size_0
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.web_asg_block_device_mappings_volume_size_1
        volume_type           = "gp2"
      }
    }
  ]

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [module.web_asg_sg.security_group_id]
    },
    {
      delete_on_termination = true
      description           = "eth1"
      device_index          = 1
      security_groups       = [module.web_asg_sg.security_group_id]
    }
  ]

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = var.web_asg_instance_tags
    },
    {
      resource_type = "volume"
      tags          = var.web_asg_volume_tags
    }
  ]

  tags = var.web_asg_tags
}

# ASG for Backend App Servers

module "app-asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = var.app_asg_name

  min_size                  = var.app_asg_min_size
  max_size                  = var.app_asg_max_size
  desired_capacity          = var.app_asg_desired_capacity
  wait_for_capacity_timeout = var.app_asg_wait_for_capacity_timeout
  health_check_type         = var.app_asg_health_check_type
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = module.app-alb.target_group_arns

  # Launch template
  launch_template_name        = var.app_asg_launch_template_name
  launch_template_description = var.app_asg_launch_template_description
  update_default_version      = var.app_asg_update_default_version

  image_id          = var.app_asg_image_id
  instance_type     = var.app_asg_instance_type
  ebs_optimized     = var.app_asg_ebs_optimized
  enable_monitoring = var.app_asg_enable_monitoring

  # IAM role & instance profile
  create_iam_instance_profile = var.app_asg_create_iam_instance_profile
  iam_role_name               = var.app_asg_iam_role_name
  iam_role_path               = var.app_asg_iam_role_path
  iam_role_description        = var.app_asg_iam_role_description
  iam_role_tags               = var.app_asg_iam_role_tags
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.app_asg_block_device_mappings_volume_size_0
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = var.app_asg_block_device_mappings_volume_size_1
        volume_type           = "gp2"
      }
    }
  ]

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [module.app_asg_sg.security_group_id]
    },
    {
      delete_on_termination = true
      description           = "eth1"
      device_index          = 1
      security_groups       = [module.app_asg_sg.security_group_id]
    }
  ]

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = var.app_asg_instance_tags
    },
    {
      resource_type = "volume"
      tags          = var.app_asg_volume_tags
    }
  ]

  tags = var.app_asg_tags
}
