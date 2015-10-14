class GamesController < ApplicationController
  def create
    option = params[:game]
    @game = Game.create
    current_user.games << @game
    if option == "ron"
      make_ron_game
    elsif option == "marvel_characters"
      make_marvel_characters_game
    end
    redirect_to "/rounds"
  end

  def results
    @current_game = Game.find(params[:game_id])
    @results = @current_game.total_score
  end

  private

  def make_ron_game
    @game.find_unique_ron_questions
    @game.create_ron_rounds
  end

  def make_marvel_characters_game
    @game.create_marvel_characters_rounds    
  end

end
