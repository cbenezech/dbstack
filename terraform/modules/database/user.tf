resource "postgresql_role" "user" {
  name     = "${var.database_name}"
  login    = false
}

resource "postgresql_role" "user_1" {
  name     = "${var.database_name}_1"
  login    = true
  password = random_password.user_1.result
  roles = [
    postgresql_role.user.name
  ]
}

resource "postgresql_role" "user_2" {
  name     = "${var.database_name}_2"
  login    = true
  password = random_password.user_2.result
  roles = [
    postgresql_role.user.name
  ]
}