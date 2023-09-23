# frozen_string_literal: true

class UsersConstroller < ApplicationRecord
  # actions
  def home; end
  def new
    @user = User.new
  end
end
