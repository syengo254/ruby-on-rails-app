class MainController < ApplicationController
  def index
    flash.now[:notice] = "logged in succefully!"
    flash.now[:alert] = "Invalid email or password!"
  end

  def contact

  end
end
