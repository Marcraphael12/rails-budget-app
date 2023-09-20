# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :money_groups
  has_many :money_tracks, through: :money_groups

  validates :name, presence: true
end
