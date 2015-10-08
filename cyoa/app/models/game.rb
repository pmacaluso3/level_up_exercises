class Game < ActiveRecord::Base
	belongs_to :user
	has_many :rounds
	
	def initialize
		10.times do
			self.rounds << Round.create
		end
	end
end