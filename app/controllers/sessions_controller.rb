class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email]) 
    if user && user.authenticate(params[:session][:password]) 
      flash.now[:success] = "you have been verified" 
      redirect_to user_path
    else 
      flash.now[:danger] = "wrong password/email combination" 
      render :new
    end 
  end 
end
