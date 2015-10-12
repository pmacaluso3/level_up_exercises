class Game < ActiveRecord::Base
  belongs_to :user
  has_many :rounds

  def create_rounds
    10.times do
      r = Round.new
      r.grab_quotes
      rounds << r
    end
  end

  def give_uncompleted_round
    rounds.uncompleted.first
  end

  def self.high_scores
    Game.all.sort_by(&:total_score).reverse
  end

  def total_score
    rounds.to_a.count(&:correct)
  end
end
