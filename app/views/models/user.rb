class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_writer :login
  has_many :reviews, dependent: :destroy

  has_and_belongs_to_many :gunplas

  validates *%i[username email password],
    presence: true

  validates :username, {
    uniqueness: { case_sensitive: false }
  }

  validate :validate_username

  has_one_attached :avatar

  after_create :attach_default_avatar

  def how_many_posts
    Review.users(self.id).length
  end

  def login
    @login || self.username || self.email
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  private def attach_default_avatar
    # avatar_path = "#{::Rails.root}/storage/defaults/default_avatar.png"
    avatar_path = Dir["#{::Rails.root}/storage/defaults/*.png"].sample
    data_to_attach = {
      io: File.open(avatar_path),
      filename: avatar_path.split('/')[-1],
      content_type: "image/png"
    }
    self.avatar.attach(data_to_attach)
  end

end