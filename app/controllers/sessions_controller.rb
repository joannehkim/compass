class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user.authenticate(params[:password])
  		session[:user_id] = @user.id 
  		redirect_to :back
  	else
  		flash[:errors] = ["Invalid email or password."]
  		redirect_to :back
  	end
  end

  def destroy
  	reset_session
  	redirect_to :root
  end
end
