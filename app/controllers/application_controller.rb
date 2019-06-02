# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= session[:user]
  end

  def logged_in?
    current_user != nil
  end
end
