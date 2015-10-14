class RoundsController < ApplicationController
  def show
    @current_game = current_user.games.order(created_at: :desc).limit(1).first
    @current_question = @current_game.give_uncompleted_round
    if @current_question.nil?
      @current_game.update_score
      redirect_to "/games/#{@current_game.id}/results"
    end
  end

  def update
    answer = params[:round][:answer]
    @current_round = Round.where(id: params[:id]).includes(:questions)[0]
    correct_answer = @current_round.questions.where(name: "ron").first.id
    @current_round.correct = true if answer.to_i == correct_answer
    @current_round.complete = true
    @current_round.save
    if request.xhr?
      render partial: 'show_result'
    else
      redirect_to "/rounds/show"
    end
  end
end
