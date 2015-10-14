class GamesController < ApplicationController
  def create
    @game = Game.create
    @game.find_unique_questions
    @game.create_rounds
    current_user.games << @game
    redirect_to "/rounds/show"
  end

  def results
    @current_game = Game.find(params[:game_id])
    @results = @current_game.total_score
  end
end
