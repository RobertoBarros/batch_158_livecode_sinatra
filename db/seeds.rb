require 'faker'

Restaurant.destroy_all

50.times do
  restaurant = Restaurant.new(name: Faker::BossaNova.song, address: Faker::Address.full_address, rating: rand(0..10))
  restaurant.save
end