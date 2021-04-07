class Gunpla < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :users
  has_many_attached :images, dependent: :destroy

  validates *%i[kit_name gundam_name grade scale gundam_series],
    presence: true

  scope :gunpla_collection, -> (user) {where("user_id = ?", user)}
end