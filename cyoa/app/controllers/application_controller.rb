class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = User.find(session[:user_id])
  end

  def calculate_results
    counter = 0
    @current_game.rounds.each do |round|
      if round.correct == true
        counter += 1
      end
    end
    counter
  end

end
