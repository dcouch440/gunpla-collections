class Review < ApplicationRecord
  belongs_to :gunpla
  belongs_to :user
  validates *%i[title content_body rating],
  presence: true
  validates_length_of :content_body, in: 50...251
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates_numericality_of :rating, greater_than_or_equal_to: 1
end