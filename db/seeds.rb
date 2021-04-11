require 'faker'
class Seed

  def self.run_seed
    # Review.destroy_all
    # User.destroy_all
    seed = Seed.new
    # 30.times do
    #   user = User.create!(user_hash())
    #   rand(4..14).times do
    #     Review.create!(review_hash(user))
    #   end
    # end
    seed.attach_avatars_to_users()
    p "Created #{User.count} users and #{Review.count} reviews."
  end

  def self.gen_paragraph
    paragraph = []
    3.times do
      paragraph << ('<p>' + Faker::Lorem.sentence(word_count: 14, supplemental: false, random_words_to_add: 14) + '</p>')
    end
    paragraph.join('')
  end
  # review HASH
  def self.review_hash(user)
    {
      user_id: user.id,
      gunpla_id: rand(1..14),
      title: Faker::Games::WorldOfWarcraft.quote,
      content_body: gen_paragraph(),
      rating: rand(1..5)
    }
  end
  # USER HASH
  def self.user_hash
    {
      username: Faker::Name.unique.first_name,
      email: Faker::Internet.email,
      bio: Faker::Quote.jack_handey,
      password: 'pass123',
      password_confirmation: 'pass123'
    }
  end

  def get_dir_length
    Dir["#{::Rails.root}/app/assets/images/avatar_images/*.*"].length
  end

  def get_dir_array
    Dir["#{::Rails.root}/app/assets/images/avatar_images/*.*"]
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
