class Admin::TeamsController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_USER"], :password => ENV["ADMIN_PASSWORD"]

  # GET /admin/teams
  def index
    @teams = Team.all
  end

  # DELETE /admin/teams/1
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_path }
    end
  end
end