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

  def create_ron_rounds
    self.true_questions = Question.where(name: "ron").sample(10)
    self.false_questions = Question.where(name: "advice").sample(10)
    10.times do |i|
      r = Round.create(questions: [true_questions[i], false_questions[i]], correct_answer_id: true_questions[i].id)
      rounds << r
    end
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

  def question_type
    rounds.first.questions.first.type if rounds.any?
  end
end
