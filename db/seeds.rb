require 'faker'

25.times do
  User.create!(email: Faker::Internet.email, password: Faker::Lorem.word)
  Restaurant.create!(creator_id: User.all.sample.id, name: Faker::Lorem.word, cuisine: Faker::Lorem.word, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode:Faker::Address.zip_code)
  Review.create!(reviewer_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, rating: rand(1..5), body: Faker::Lorem.paragraph)
end
