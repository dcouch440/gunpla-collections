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






class Seed

  def self.run_seed
    User.destroy_all
    seed = Seed.new
    15.times {User.create(user_hash)}
    seed.attach_avatars_to_users
  end


  def self.gen_paragraph
    paragraph = []
    3.times do
      paragraph << ('<p>' + Faker::Lorem.sentence(word_count: 14, supplemental: false, random_words_to_add: 14) + '</p>')
    end
    paragraph.join('')
  end

  def self.user_hash
    {
      email: 'u@u.com',
      password: 'foo',
      content_body: gen_paragraph()
    }
  end

  def get_dir_length
    Dir["#{::Rails.root}/storage/defaults/*.*"].length
  end

  def get_dir_array
    Dir["#{::Rails.root}/storage/defaults/*.*"]
  end

  def get_dir_hash_using_index(index)
    dir = get_dir_array()[index]
    {
      io: File.open(dir),
      filename: dir.split('/')[-1],
      content_type: "image/#{dir.split('.')[-1]}"
    }
  end

  def attach_avatars_to_users

    current_index = -1
    User.all.each do |user|

      if current_index >= get_dir_length() - 1
        current_index = 0
        user.avatar.attach(get_dir_hash_using_index(current_index))
      else
        current_index += 1
        user.avatar.attach(get_dir_hash_using_index(current_index))
      end

    end
  end

end

Seed.run_seed()
