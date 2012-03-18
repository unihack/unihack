class TeamsController < ApplicationController
  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/new
  def new
    @team = Team.new
    4.times { @team.members.build }
  end

  # POST /teams
  def create
    @team = Team.new(params[:team])
    @team.members.delete_if {|m| m.name.blank?}
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path, 
          notice: 'Team was successfully created.' }
      else
        (4 - @team.members.count).times { @team.members.build }
        format.html { render action: "new" }
      end
    end
  end
end
