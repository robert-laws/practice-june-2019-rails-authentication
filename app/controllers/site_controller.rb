# frozen_string_literal: true

class SiteController < ApplicationController
  def index
    @welcome = 'hello'
  end

  def login
    session[:user] = 'bob'
    render :login
  end

  def logout
    session.delete :user
    redirect_to root_path
  end
end
