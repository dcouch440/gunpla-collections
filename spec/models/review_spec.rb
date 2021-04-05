require 'rails_helper'

describe Review do
  describe 'validation' do
    %i[title rating content_body].each { |property| it { should validate_presence_of property } }
  end
  describe 'associations' do
    %i[user gunpla].each { |property| it { should belong_to property } }
  end
end