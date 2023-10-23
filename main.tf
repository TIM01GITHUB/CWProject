terraform {

backend "s3" {
    bucket         = "cw-tf"
    key            = "tf-infra/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "cw-project"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

module "tf-state" {
  source      = "./modules/tf-state"
  bucket_name = local.bucket_name
  table_name  = local.table_name
}


module "ecrRepo" {
  source = "./modules/ecr"

  ecr_repo_name = local.ecr_repo_name
}

module "ecsCluster" {
  source = "./modules/ecs"

  cw_app_cluster_name = local.cw_app_cluster_name
  availability_zones    = local.availability_zones

  cw_app_task_famliy         = local.cw_app_task_famliy
  ecr_repo_url                 = module.ecrRepo.repository_url
  container_port               = local.container_port
  cw_app_task_name           = local.cw_app_task_name
  ecs_task_execution_role_name = local.ecs_task_execution_role_name

  application_load_balancer_name = local.application_load_balancer_name
  target_group_name              = local.target_group_name
  cw_app_service_name          = local.cw_app_service_name
}
