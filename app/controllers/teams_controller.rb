class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show home_matches away_matches ]

  # GET /teams - added to list teams/countries with ID - in order to update list of matches associated with team/country it must be done with home/away country ID
  def index
    @teams = Team.all

    render json: { teams: @teams }
  end

  # GET /teams/1
  def show
    render json: { id: @team.id, team_name: @team.country, abbreviation: @team.abbreviation }
  end

  # GET /teams/1/home_matches
  def home_matches
    home_matches = @team.home_matches

    if home_matches.any?
      render json: { team_name: @team.country, home_matches: home_matches }
    else
      render json: { error: "No home matches found for this team." }, status: :not_found
    end
  end

  # GET /teams/1/away_matches
  def away_matches
    away_matches = @team.away_matches

    if away_matches.any?
      render json: { team_name: @team.country, away_matches: away_matches  }
    else
      render json: { error: "No away matches found for this team." }, status: :not_found
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end
end
