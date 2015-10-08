module ApplicationHelper

  def logged_in?
  	session[:user_id] != nil && User.find_by(id: session[:user_id])
  end

end
