
################################################################################
# Supporting Resources
################################################################################

module "db_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "~> 4.0"
  name        = var.rds_sg_name
  description = var.rds_sg_description
  vpc_id      = module.vpc.vpc_id
  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      source_security_group_id = module.app_asg_sg.security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
  tags                                                     = var.rds_sg_tags
}


################################################################################
# Aurora database Multi-AZ (RDS)
################################################################################

resource "aws_rds_cluster_instance" "cluster_instances" {

  count                = var.rds_instance_count
  identifier           = "aurora-cluster-inst-${count.index}"
  cluster_identifier   = aws_rds_cluster.auroradb.id
  instance_class       = var.rds_instance_class
  engine               = aws_rds_cluster.auroradb.engine
  engine_version       = aws_rds_cluster.auroradb.engine_version
  publicly_accessible  = false
  db_subnet_group_name = module.vpc.database_subnet_group
  tags                 = var.rds_db_instance_tags

}

resource "aws_rds_cluster" "auroradb" {

  cluster_identifier              = "aurora-cluster-demo"
  availability_zones              = var.rds_azs
  engine                          = var.aurora_mysql_engine
  engine_version                  = var.rds_engine_version
  database_name                   = var.rds_db_name
  master_username                 = var.rds_username
  master_password                 = var.rds_password
  port                            = var.rds_port
  enabled_cloudwatch_logs_exports = var.rds_enabled_cloudwatch_logs_exports
  db_subnet_group_name            = module.vpc.database_subnet_group
  vpc_security_group_ids          = [module.db_security_group.security_group_id]
  final_snapshot_identifier       = "aurora-cluster-backup"
  skip_final_snapshot             = true
  tags                            = var.rds_tags

}

