class Gunpla < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :users
  has_many_attached :images, dependent: :destroy

  validates *%i[kit_name gundam_name grade scale gundam_series],
    presence: true

  scope :gunpla_collection, -> (user) {where("user_id = ?", user)}

  def self.sort_all_by_review
    Gunpla.all.sort {|zap, zoo|
      zap.reviews.average(:rating) <=> zoo.reviews.average(:rating)
    }.reverse()
  end

  def reviews_avg
    self.reviews.average(:rating).round(1).to_f()
  end

end