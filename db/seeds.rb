# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
Order.delete_all
generator = proc do |start_time, end_time, shipping|
  time = Time.at(rand(end_time.to_i - start_time.to_i) + start_time.to_i)
  dollars = rand(200) + 10
  Order.create!(price: dollars, purchased_at: time, shipping: rand(shipping))
end
200.times { generator.call(10.days.ago, Time.zone.now.end_of_day, 1) }
500.times { generator.call(1.month.ago, Time.zone.now.end_of_day, 2) }
Order.create!(price: 10, purchased_at: 1.month.ago.beginning_of_day, shipping: true)
