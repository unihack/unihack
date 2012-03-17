class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "bananpaj"

  def index
    @teams = Team.all
  end
end
