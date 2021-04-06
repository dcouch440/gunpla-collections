require 'faker'

User.destroy_all
Review.destroy_all

20.times do
  user = User.create!({ username: Faker::JapaneseMedia::DragonBall.character,
                         email: Faker::Internet.email,
                         password: 'pass123',
                         password_confirmation: 'pass123' })
  5.times do
    reviews = Review.create!({ user_id: user.id, gunpla_id: rand(1..14), title: Faker::Games::WorldOfWarcraft.quote,
                               content_body: Faker::Lorem.paragraph_by_chars(number: 650, supplemental: false),
                               rating: rand(1..5) })
  end
end

p "Created #{User.count} users and #{Review.count} reviews."
