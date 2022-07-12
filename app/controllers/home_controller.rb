class HomeController < ApplicationController
  def destroy_all
    Team.destroy_all
    Match.destroy_all
    redirect_to root_path
  end
end
