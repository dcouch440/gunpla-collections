require 'faker'

User.destroy_all
Review.destroy_all

20.times do
  user = User.create!({
                        username: Faker::JapaneseMedia::DragonBall.character,
                        email: Faker::Internet.email,
                        bio: Faker::Quote.jack_handey,
                        password: 'pass123',
                        password_confirmation: 'pass123'
  })
  rand(4..14).times do
    reviews = Review.create!({
                                user_id: user.id,
                                gunpla_id: rand(1..14),
                                title: Faker::Games::WorldOfWarcraft.quote,
                                content_body: Faker::Lorem.paragraph_by_chars(number: 900, supplemental: false),
                                rating: rand(1..5)
    })
  end
end

p "Created #{User.count} users and #{Review.count} reviews."