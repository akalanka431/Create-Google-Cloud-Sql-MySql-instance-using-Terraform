resource "google_sql_database_instance" "mysql-from-terraform" {
    name = "mysql-from-terraform"
    region = "us-central1"
    database_version = "MYSQL_8_0"
    settings {
      tier = "db-f1-micro"
    }
    deletion_protection = "false"
}

resource "google_sql_database" "database-from-tf" {
  name = "my-database-from-tf"
  instance = google_sql_database_instance.mysql-from-terraform.name
}

resource "google_sql_user" "myuser" {
  name = "simpledevops"
  instance = google_sql_database_instance.mysql-from-terraform.name
  password = "simpledevops"
}