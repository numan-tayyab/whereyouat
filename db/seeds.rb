require "geocoder"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Deleting Existing Users"
User.all.each(&:destroy)
puts "Seeding Super Admins"
super_admin = User.new(:email => 'superadmin@whereyouat.com', password: "12345678",
                       is_super_admin: true)
super_admin.save!

puts "Seeding Users"
(1..9).each do |id|
  user = User.new(:email => "user#{id}@whereyouat.com", :is_super_admin => false)
  user.profile = Profile.new(:user_name => "user#{id}", :status => "single", :dob => (Date.today - 25.years))
  user.save!
end
puts "Deleting existing Locations"
Location.all.each(&:destroy)
puts "Seeding Locations"
(["Siddiq Trade Centre,Gulberg,Lahore,Pakistan", "Liberty Market , Lahore,Pakistan", "Johar Town, Lahore ,Pakistan", "Model Town, Lahore,Pakistan"]).each_with_index do |loc, num|
  location = Location.create(:name => "Location#{num}", :complete_address => loc)
  location.users << User.find_by_email("user#{num+1}@whereyouat.com")
end
puts "Seeding Users Quotes"
User.where(:is_super_admin => false).each do |user|
  user.statuses << Status.create(:status => "I am feeling good Today")
end