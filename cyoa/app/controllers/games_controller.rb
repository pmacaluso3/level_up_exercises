class GamesController < ApplicationController

	def show
		@game = Game.create
    @game.create_rounds
	end




end

