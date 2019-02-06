# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
user = User.find_or_initialize_by(email: "demo@haulhq.com")
user.name = "Demo User"
user.password = "password1"
user.password_confirmation = "password1"
user.save!
