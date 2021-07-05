resource "google_cloud_run_service" "cookingbomb_api" {
  name     = "cookingbomb-srv"
  location = "us-west1"

  template {
    spec {
      containers {
        image = "gcr.io/cooking-bomb/app:latest"
        env {
          name  = "ENV"
          value = "production"
        }
        env {
          name  = "MYSQL_CONNECTION_NAME"
          value = "cooking-bomb:us-west1:cookingbomb-db"
        }
        env {
          name  = "MYSQL_ROOT_PASSWORD"
          value = var.MYSQL_ROOT_PASSWORD
        }
        env {
          name  = "MYSQL_USER"
          value = "root"
        }
        env {
          name  = "MYSQL_PASSWORD"
          value = var.MYSQL_ROOT_PASSWORD
        }
        env {
          name  = "MYSQL_DATABASE"
          value = google_sql_database.cookingbomb_database.name
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "cookingbomb_api_policy_noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "cookingbomb_api" {
  location = google_cloud_run_service.cookingbomb_api.location
  project  = google_cloud_run_service.cookingbomb_api.project
  service  = google_cloud_run_service.cookingbomb_api.name

  policy_data = data.google_iam_policy.cookingbomb_api_policy_noauth.policy_data
}
