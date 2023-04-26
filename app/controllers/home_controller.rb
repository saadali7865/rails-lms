class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    set_current_user
  end


  private
  def set_current_user
    @current_user = current_user
  end

end