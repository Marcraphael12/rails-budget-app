# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MoneyTracks', type: :request do
  let(:user) { User.create(name: 'Marc') }
  let(:group) { Group.create(name: 'Fast Food', icon: 'http//', user:) }

  describe 'GET /new' do
    before { get new_group_money_track_path(group_id: group.id) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'new' template" do
      expect(response).to render_template('new')
    end
  end
end
