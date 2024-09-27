# frozen_string_literal: true

module SessionsHelper

  #! methods written in SessionsHelper are automatically available in views but not in controller
  #therefore i have included this module in application controller because there i have used methods logged_in? and current_user which are defined in this module
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to root_path, status: :see_other, notice: "You have signed in successfully"
  end

  def logged_in?
    session[:user_id].present?
  end
end
