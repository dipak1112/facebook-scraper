class SessionsController < ApplicationController
	def create
    user = User.from_omniauth(env["omniauth.auth"])
    Resque.enqueue(GetProfile, user.id)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
