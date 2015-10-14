class Question < ActiveRecord::Base
  has_many :questions_rounds
  has_many :rounds, through: :questions_rounds

end
