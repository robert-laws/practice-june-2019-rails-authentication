# frozen_string_literal: true

class AccessController < ApplicationController
  skip_before_action :confirm_logged_in, only: %i[login login_attempt logout]

  def login
    @user = User.new
  end

  def login_attempt
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      authorized_user = found_user.authenticate(params[:password]) if found_user
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = 'success|You are now logged in.'
      redirect_to(user_path(authorized_user.id))
    else
      flash.now[:notice] = 'danger|Invalid username/password combination'
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'success|You are now logged out'
    redirect_to(login_path)
  end
end
