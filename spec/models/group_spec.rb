# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'check relation with other tzbles' do
    it { should belong_to(:user) }
    it { should have_many(:money_tracks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
