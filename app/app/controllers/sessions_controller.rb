class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged In"
      redirect_to root_path, notice: "Signed In"
    else
      flash[:alert] = "Wrong Credentials!"
      render :new
    end
  end

  def destroy
  end
end
