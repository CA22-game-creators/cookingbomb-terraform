resource "google_sql_database_instance" "cookingbomb" {
  name             = "cookingbomb-mysql"
  database_version = "MYSQL_8_0"
  region           = "us-west1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "cookingbomb_database" {
  name      = "cooking_bomb"
  instance  = google_sql_database_instance.cookingbomb.name
  charset   = "utf8mb4"
  collation = "utf8mb4_bin"
}
