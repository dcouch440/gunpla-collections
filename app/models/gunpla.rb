class Gunpla < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :users

  validates *%i[kit_name gundam_name grade scale gundam_series],
    presence: true
end