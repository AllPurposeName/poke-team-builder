class TeamController < ApplicationController
  def show
    @team = Team.find(params[:team])
  end

  def add
    team = Team.find_by(user_id: current_user.user.id)
    team.add(params[:poke])
    redirect_to team_path(team: team)
  end
end
