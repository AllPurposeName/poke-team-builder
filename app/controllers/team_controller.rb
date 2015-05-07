class TeamController < ApplicationController
  def show
    @team = Team.find(params[:team]).decorate
  end

  def add
    team = Team.find_by(user_id: current_user.user.id)
    team.add(params[:poke])
    redirect_to root_path
  end

  def remove
    team = current_user.team
    team.remove(params[:poke])
    redirect_to team_path(team: team)
  end

end
