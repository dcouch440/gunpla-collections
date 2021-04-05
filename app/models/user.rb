class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :gunplas
  validates *%i[username email password],
  presence: true

end