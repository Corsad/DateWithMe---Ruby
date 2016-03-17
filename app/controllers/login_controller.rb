class LoginController < ApplicationController
  def index
  end

  def create
  	redirect_to users_path
  end

end
