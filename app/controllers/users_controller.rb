# frozen_string_literal: true

class UsersConstroller < ApplicationRecord
  # actions

  def new
    @user = User.new
  end
end
