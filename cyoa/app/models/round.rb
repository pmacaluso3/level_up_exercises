class Round < ActiveRecord::Base
	belongs_to :game
	has_many :quotes_rounds
	has_many :quotes, through: :quotes_rounds

	def correct?
		self.correct
	end
end