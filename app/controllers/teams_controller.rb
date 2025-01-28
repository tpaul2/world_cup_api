class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show home_matches away_matches ]

  # GET /teams/1
  def show
    render json: @team
  end

  # GET /teams/1/home_matches
  def home_matches
    home_matches = @team.home_matches
    
    if home_matches.any?
      render json: home_matches
    else
      render json: { error: "No home matches found for this team."}, status: :not_found
    end
  end

  # GET /teams/1/away_matches
  def away_matches
    away_matches = @team.away_matches

    if away_matches.any?
      render json: away_matches
    else
      render json: { error: "No away matches found for this team."}, status: :not_found
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end
end
