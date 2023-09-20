# frozen_string_literal: true

class MoneyTrack < ApplicationRecord
  # relations with other tables
  belongs_to :user
  has_many :money_groups
  has_many :groups, through: :money_groups

  # validations

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
