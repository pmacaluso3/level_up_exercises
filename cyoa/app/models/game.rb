class Game < ActiveRecord::Base
  belongs_to :user
  has_many :rounds

  attr_accessor :true_quotes, :false_quotes

  def find_unique_quotes
    true_ids_array = Quote.where(ron_said_it: true).pluck(:id).sample(10)
    false_ids_array = Quote.where(ron_said_it: false).pluck(:id).sample(10)
    self.true_quotes = Quote.where(id: true_ids_array)
    self.false_quotes = Quote.where(id: false_ids_array)
  end

  def create_rounds
    10.times do |i|
      r = Round.new
      r.quotes << true_quotes[i-1]
      r.quotes << false_quotes[i-1]
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