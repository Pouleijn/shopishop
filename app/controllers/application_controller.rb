# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_categories
    Category.public.includes(:labels)
  end
  helper_method :current_categories

  def cart_items
    []
  end
  helper_method :cart_items
end
