class Game < ActiveRecord::Base
	belongs_to :user
	has_many :rounds

  def create_rounds
      10.times do
      r = Round.new
      r.grab_quotes
      self.rounds << r
    end
  end

  def give_uncompleted_round
    uncompleted = rounds.select {|round| !round.complete}
    uncompleted[0]
  end


end