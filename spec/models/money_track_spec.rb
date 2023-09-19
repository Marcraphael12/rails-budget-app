require 'rails_helper'

RSpec.describe MoneyTrack, type: :model do
  describe 'check relation with other tables' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).only_integer }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end
end
