class Round < ActiveRecord::Base
	belongs_to :game
	has_many :quotes_rounds
	has_many :quotes, through: :quotes_rounds


  def grab_quotes
    quotes << Quote.where(ron_said_it: true).sample
    quotes << Quote.where(ron_said_it: false).sample
  end



end