class RoundsController < ApplicationController
  def show
    game = current_user.games.sort_by(&:created_at)
    @current_game = game.last
    @current_question = @current_game.give_uncompleted_round
    redirect_to "/games/#{@current_game.id}/results" if @current_question.nil?
  end

  def update
    answer = params[:round][:correct]
    @current_round = Round.find(params[:id])
    @current_round.update_attributes(correct: true) if answer == "true"
    @current_round.update_attributes(complete: true)
    redirect_to "/rounds/show"
  end
end
