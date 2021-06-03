require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:favourites) }
    it { should have_many(:houses) }
    it { should have_one_attached(:avatar) }
    it { should have_many(:favourited_houses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(15)  }
  end
end
