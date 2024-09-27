# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
    else
      # flash.keep[:danger] = "Invalid email/password combination"
      message = "Email or password incorrect"
      flash.now[:danger] = message
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "You have logged out"
  end
end
