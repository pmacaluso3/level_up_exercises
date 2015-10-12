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
    answer = params[:round][:correct]
    @current_round = Round.find(params[:id])
    @current_round.correct = true if answer == "true"
    @current_round.complete = true
    @current_round.save
    redirect_to "/rounds/show"
  end
end
