class HomeController < ApplicationController
	layout "login", :only => [:index]
  def index
  	if current_user.present?
  		redirect_to dashboard_path
  	end
  end

  def dashboard
  end
  
end
