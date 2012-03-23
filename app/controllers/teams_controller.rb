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
    members_copy = Array.new(@team.members)
    @team.members.delete_if { 
      |m| m.name.blank? && m.email.blank? && m.github.blank? 
    }
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_path }
      else
        @team.members = members_copy
        format.html { render action: "new" }
      end
    end
  end
end
