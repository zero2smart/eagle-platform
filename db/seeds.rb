# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

haul_admin = User.find_or_initialize_by(email: "admin@haulhq.com")
haul_admin.name = "Haul Admin"
haul_admin.password = "password1"
haul_admin.password_confirmation = "password1"
haul_admin.role = :haul_admin
haul_admin.save!
# haul_admin.confirm!

vendor = Vendor.find_or_initialize_by(name: "Demo Trucking")
vendor.address = Faker::Address.street_address
vendor.city = Faker::Address.city
vendor.state = Faker::Address.state_abbr
vendor.zip_code = Faker::Address.zip_code
vendor.phone_number = Faker::PhoneNumber.phone_number
vendor.save!

vendor.users.destroy_all
[:manager, :sales_manager, :sales, :dispatch].each do |role|

  u = vendor.users.find_or_initialize_by(email: "#{role}@demo.com")
  u.name = "Demo #{role.to_s.titleize}"
  u.password = "password1"
  u.password_confirmation = "password1"
  u.role = role
  u.save!
  # u.confirm!

end

puts "Users:"
puts vendor.users.map{|u| "#{u.email} - #{u.name}\n"}


vendor.trucks.destroy_all
(100..120).each do |number|
  vendor.trucks.create! do |t|
    t.number = number
    t.is_owned = true
    t.last_maintained_on = rand(Date.today-90.days..Date.today)
    t.maintenance_period = [3,6,9,12].sample
  end
end
puts "#{vendor.trucks.is_owned.count} Demo Trucks"

(200..280).each do |number|
  vendor.trucks.create! do |t|
    t.number = number
    t.is_owned = false
    t.last_maintained_on = rand(Date.today-90.days..Date.today)
    t.maintenance_period = [3,6,9,12].sample
  end
end
puts "#{vendor.trucks.is_private.count} Private Trucks"




