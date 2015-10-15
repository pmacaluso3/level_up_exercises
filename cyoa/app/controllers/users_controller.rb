class UsersController < ApplicationController
  def index
    @hi_score_games = Game.includes(:user).order(score: :desc)
    @grouped_games = @hi_score_games.group_by { |game| game.question_type }
    @ron_games = @grouped_games["Quote"]
    @marvel_games = @grouped_games["Character"]
    @users = @hi_score_games.map(&:user)
    if @ron_games
      @ron_users = @ron_games.map(&:user)
    end
    if @marvel_games
    p "**********************************************"
     p @marvel_users = @marvel_games.map(&:user)
    end
    @game_in_progress = game_in_progress?
  end

  def login
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = "You are going to hell"
      @users = User.all
      render "users/index"
    end
  end

  def logout
    session.destroy
    redirect_to '/'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = "you are going to hell"
      render "users/index"
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
