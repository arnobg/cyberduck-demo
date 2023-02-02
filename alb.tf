################################################################################
# Supporting Resources
################################################################################

# Security group for frontend Load balancer

resource "aws_security_group" "web_alb_sg" {

  name        = var.web_alb_sg_name
  vpc_id      = module.vpc.vpc_id
  description = var.web_alb_sg_description

  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.web_alb_sg_ingress_cidr_blocks
  }

  tags = var.web_alb_sg_tags
}

# Security group for backend Load balancer

resource "aws_security_group" "app_alb_sg" {

  name        = var.alb_sg_name
  vpc_id      = module.vpc.vpc_id
  description = var.alb_sg_description

  ingress {
    description     = "HTTP from web layer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_alb_sg.id]
  }

  tags = var.alb_sg_tags
}

/*
module "app_alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name              = var.alb_sg_name
  vpc_id            = module.vpc.vpc_id
  description       = var.alb_sg_description
  security_group_id = module.web_alb_sg.security_group_id
  tags              = var.alb_sg_tags
}
*/

################################################################################
# Application load balancers (ALB)
################################################################################

# Frontend Application Load balancer

module "web-alb" {
  source          = "terraform-aws-modules/alb/aws"
  version         = "~> 6.0"
  name            = var.web_alb_name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [aws_security_group.web_alb_sg.id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name             = var.web_alb_target_group_name
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/health"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    },
  ]

  tags = var.web_alb_tags
}

# Backend Application Load balancer

module "app-alb" {
  source          = "terraform-aws-modules/alb/aws"
  version         = "~> 6.0"
  name            = var.alb_name
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [aws_security_group.app_alb_sg.id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name             = var.alb_target_group_name
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/health"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    },
  ]

  tags = var.alb_tags
}

