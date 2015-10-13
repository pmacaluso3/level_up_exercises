class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def game_in_progress?
    !current_game.completed? if current_game
  end

  def current_game
    current_user.games.order(created_at: :desc).limit(1).first if current_user
  end
end
