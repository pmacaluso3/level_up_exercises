class RoundsController < ApplicationController

  def show
    game = current_user.games.sort_by { |game| game.created_at }
    @current_game = game.last
    @current_question = @current_game.give_uncompleted_round
  end

end
