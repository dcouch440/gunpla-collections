require 'rails_helper'

describe Gunpla do

  describe 'associations' do
    it{ should have_many(:reviews) }
    it{ should have_and_belong_to_many(:users) }
  end

  describe 'validations' do
    it{ should validate_presence_of(:kit_name) }
    it{ should validate_presence_of(:gundam_name) }
    it{ should validate_presence_of(:grade) }
    it{ should validate_presence_of(:scale) }
    it{ should validate_presence_of(:gundam_series) }
  end
end