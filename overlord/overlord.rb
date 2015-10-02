# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require_relative 'models/bomb'

enable :sessions

get '/' do
	redirect :"/bomb/new"
end

get '/bomb/new' do
	erb :new
end

post '/code' do
	BOMB.enter_code(params[:code])
	redirect :"/bomb/show"
end

post '/bomb' do
	codes = params[:codes]
	act = codes[:activation]
	act = "1234" if act == ""
	deact = codes[:deactivation]
	deact = "0000" if deact == ""
	BOMB = Bomb.new(act, deact)
	redirect :"/bomb/show"
end

get	'/bomb/show' do
	@bomb = BOMB
	erb :"show"
end

# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= (Time.now).to_s
end
