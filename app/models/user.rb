class User < ApplicationRecord
	has_many :groups
  has_many :money_tracks

	validates :name, presence: true, length: { maximum: 50 }
end
