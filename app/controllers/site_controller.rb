# frozen_string_literal: true

class SiteController < ApplicationController
  skip_before_action :confirm_logged_in, only: %i[index]

  def index
    @welcome = 'hello'
  end

  def about; end
end
