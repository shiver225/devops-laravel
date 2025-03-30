output "cloud_run_url" {
  value = google_cloud_run_service.laravel.status[0].url
}

output "database_connection" {
  value = google_sql_database_instance.postgres.connection_name
}

output "redis_host" {
  value = google_redis_instance.cache.host
}
