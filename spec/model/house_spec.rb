require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'associations' do
    it { should have_many(:favourites) }
    it { should have_many(:favouritors) }
    it { should have_one_attached(:images) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:rooms) }
    it { should validate_numericality_of(:rooms) }
    it { should validate_presence_of(:location) }
  end
end
