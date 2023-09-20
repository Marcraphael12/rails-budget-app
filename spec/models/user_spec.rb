# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Marc') }

  before { user.save }

  describe 'assocciations' do
    it { should have_many(:money_tracks) }
    it { should have_many(:groups) }
  end

  describe 'validations' do
    context 'with correct parameters' do
      it 'name, email, password should be present' do
        expect(user).to be_valid
      end
    end

    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'name should not be too long' do
      user.name = 'A very long name is not admitted in our app'
      expect(user).to_not be_valid
    end
  end
end
