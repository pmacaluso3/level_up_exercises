class Round < ActiveRecord::Base
  belongs_to :game
  has_many :questions_rounds
  has_many :questions, through: :questions_rounds

  scope :completed, -> { where(complete: true) }
  scope :uncompleted, -> { where(complete: false) }

  def correct?
    correct
  end
end
