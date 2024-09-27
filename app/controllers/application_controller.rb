# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  #methods defined in ApplicationController are automatically available in all controllers becuase all controller inherits from AplicationController . But are not availalble in views . To make it available in views we need to use helper_method declaration . for example
  #
  #def hello
  # puts "hello world"
  #end

  #this method hello is available in all controller not in views and to make it available in views we do
  #helper_method :hello

  def require_admin
    redirect_to login_path unless current_user.is_admin?
  end

  def require_editor
    redirect_to login_path unless current_user.is_editor?
  end

  def logged_in_user
    return if logged_in?
    flash[:success] = "please login"
    redirect_to login_path
  end

  # def require_user_to_login
  #   redirect_to login_path unless current_user
  #   flash[:error] = "please login"
  # end
end
