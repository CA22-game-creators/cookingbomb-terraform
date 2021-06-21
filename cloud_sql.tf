resource "google_sql_database_instance" "cooking_bomb" {
  name             = "cookingbomb-mysql"
  database_version = "MYSQL_8_0"
  region           = "us-west1"

  settings {
    tier = "db-f1-micro"
  }
}
