locals {
  bucket_name = "cw-tf"
  table_name  = "cw-project"

  ecr_repo_name = "cw-app-ecr-repo"

  cw_app_cluster_name        = "cw-app-cluster"
  availability_zones           = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  cw_app_task_famliy         = "cw-app-task"
  container_port               = 3000
  cw_app_task_name           = "cw-app-task"
  ecs_task_execution_role_name = "cw-app-task-execution-role"

  application_load_balancer_name = "cw-app-alb"
  target_group_name              = "cw-alb-tg"

  cw_app_service_name = "cw-app-service"
 
}
