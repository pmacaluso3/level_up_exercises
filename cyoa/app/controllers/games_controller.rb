class GamesController < ApplicationController

	def create
		@game = Game.create
    @game.create_rounds
    current_user.games << @game
    redirect_to "/rounds/show"
	end

  def results
    @current_game = Game.find(params[:game_id])
    @results = calculate_results
  end


end

