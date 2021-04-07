class ApplicationRecord < ActiveRecord::Base

  include ActionView::Helpers::DateHelper

  self.abstract_class = true

  def created_in_english
    time_ago_in_words(self.created_at)
  end



end
