resource "postgresql_database" "main" {
  name              = var.database_name
}

resource "postgresql_grant" "all_privileges" {
  database    = postgresql_database.main.name
  role        = postgresql_role.user.name
  object_type = "database"
  privileges  = ["ALL"]
}