class Game < ActiveRecord::Base
  belongs_to :user
  has_many :rounds

  attr_accessor :true_questions, :false_questions

  scope :high_scores, -> { order(score: :desc) }

  def update_score
    self.score = total_score
    save
  end

  def completed?
    rounds.all?(&:complete)
  end

  def give_uncompleted_round
    rounds.uncompleted.first
  end

  def total_score
    rounds.to_a.count(&:correct)
  end

  def find_unique_ron_questions
    true_ids_array = Question.where(name: "ron").pluck(:id).sample(10)
    false_ids_array = Question.where(name: "advice").pluck(:id).sample(10)
    self.true_questions = Question.where(id: true_ids_array)
    self.false_questions = Question.where(id: false_ids_array)
  end

  def create_ron_rounds
    10.times do |i|
      r = Round.create
      r.questions << true_questions[i - 1]
      r.questions << false_questions[i - 1]
      r.correct_answer_id = true_questions[i - 1].id
      rounds << r
    end
  end

  def find_unique_marvel_character_questions
    
  end

  def create_marvel_characters_rounds
    character_array = Character.all.sample(40)
    10.times do
      these_four = character_array.slice!(0..3)
      correct_character = these_four.first
      r = Round.create(questions: these_four, correct_answer_id: correct_character.id)
      rounds << r
    end
  end
end
