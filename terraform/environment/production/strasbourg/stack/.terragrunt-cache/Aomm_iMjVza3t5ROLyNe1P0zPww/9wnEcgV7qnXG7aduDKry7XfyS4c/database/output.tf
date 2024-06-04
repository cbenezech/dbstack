output "user_1_password" {
  value = random_password.user_1.result
  sensitive = true
}

output "user_2_password" {
  value = random_password.user_1.result
  sensitive = true
}