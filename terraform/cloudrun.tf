resource "google_cloud_run_service" "laravel" {
  name     = "devops-laravel"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/devops-laravel"
        
        env {
          name  = "DB_CONNECTION"
          value = "pgsql"
        }
        env {
          name  = "DB_HOST"
          value = google_sql_database_instance.postgres.connection_name
        }
        env {
          name  = "DB_DATABASE"
          value = var.database_name
        }
        env {
          name  = "DB_USERNAME"
          value = var.database_user
        }
        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.db_password.secret_id
              key  = "latest"
            }
          }
        }
        env {
          name  = "REDIS_HOST"
          value = google_redis_instance.cache.host
        }
      }
    }
  }
}
