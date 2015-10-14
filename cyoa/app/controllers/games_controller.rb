class GamesController < ApplicationController
  def create
    option = params[:game]
    if option == "ron"

    elsif option == "marvel_characters"

    end
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

  private

  def create_ron_game
    
  end

  def create_marvel_characters_game
    
  end

end
