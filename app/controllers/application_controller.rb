# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  before_action :confirm_logged_in

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = 'danger|Please Login'
      redirect_to(login_path)
    end
  end
end
