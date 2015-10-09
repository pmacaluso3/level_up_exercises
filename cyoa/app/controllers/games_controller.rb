class GamesController < ApplicationController

	def create
		@game = Game.create
    @game.create_rounds
    current_user.games << @game
    redirect_to "/rounds/show"
	end




end

