resource "google_sql_database_instance" "postgres" {
  name             = "laravel-postgres"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "user" {
  name     = var.database_user
  instance = google_sql_database_instance.postgres.name
  password = random_password.database_password.result
}

resource "random_password" "database_password" {
  length  = 16
  special = true
}
