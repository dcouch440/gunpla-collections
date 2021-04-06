class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  has_and_belongs_to_many :gunplas

  validates *%i[username email password],
    presence: true
    has_one_attached :avatar

  after_create :attach_default_avatar

  private def attach_default_avatar
    avatar_path = "#{::Rails.root}/storage/defaults/default_avatar.png"
    self.avatar.attach(io: File.open(avatar_path), filename: "default_avatar.png", content_type: "image/png")
  end
  
end