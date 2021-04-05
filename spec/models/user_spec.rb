require 'rails_helper'

describe User do
  describe 'validation' do
    %i[username email password].each { |property| it { should validate_presence_of property } }
  end
  describe 'associations' do
    it{ should have_many(:reviews) }
    it{ should have_and_belong_to_many(:gunplas) }
  end
end