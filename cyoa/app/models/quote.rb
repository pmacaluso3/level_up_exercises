class Quote < ActiveRecord::Base
	attr_accessible :content, :ron_said_it

	has_many :quotes_rounds
	has_many :rounds, through: :quotes_rounds

	def ron_said_it?
		self.ron_said_it
	end
end