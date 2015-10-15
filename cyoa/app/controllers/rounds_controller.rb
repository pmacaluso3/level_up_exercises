class RoundsController < ApplicationController
  def index
    @current_game = current_user.games.order(created_at: :desc).limit(1).first
    @current_round = @current_game.give_uncompleted_round
    if @current_round.nil?
      @current_game.update_score
      redirect_to "/games/#{@current_game.id}/results" and return
    end
    @questions = @current_round.questions
    @correct_question = Question.find_by(id: @current_round.correct_answer_id)
    if @questions.first.type == "Quote"
      render :ron_index
    elsif @questions.first.type == "Character"
      render :marvel_characters_index
    end
  end

  def update
    answer = params[:round][:answer]
    @current_round = Round.where(id: params[:id]).includes(:questions)[0]
    correct_answer = @current_round.correct_answer_id
    @current_round.correct = true if answer.to_i == correct_answer
    @current_round.complete = true
    @current_round.save
    @questions = @current_round.questions
    if request.xhr?
      if @questions.first.type == "Quote"
        render partial: 'show_ron_result'
      elsif @questions.first.type == "Character"
        render partial: 'show_marvel_result'
      end
    else
      redirect_to "/rounds"
    end
  end
end
