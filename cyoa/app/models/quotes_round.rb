class QuotesRound < ActiveRecord::Base
	belongs_to :round
	belongs_to :quote

end