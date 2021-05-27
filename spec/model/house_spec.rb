require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'associations' do
    it { should have_many(:favourites) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:built_date) }
    it { should validate_presence_of(:number_of_rooms) }
    it { should validate_presence_of(:location) }
  end
end
