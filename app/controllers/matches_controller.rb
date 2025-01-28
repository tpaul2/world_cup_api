class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show update ]

  # GET /matches
  def index
    @matches = Match.all

    render json: { all_matches: @matches }
  end

  # GET /matches/1
  def show
    render json: @match
  end

  # POST /matches
  def create
    home_team = Team.find_by(abbreviation: match_params[:home_country_name])
    away_team = Team.find_by(abbreviation: match_params[:away_country_name])

    if home_team.nil? || away_team.nil?
      render json: { error: "One or both teams could not be found." }, status: :unprocessable_entity
      return
    end

    @match = Match.new(match_params)
    @match.home_country = home_team
    @match.away_country = away_team

    if @match.save
      render json: @match, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end


  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:home_country_name, :away_country_name, :home_score, :home_penalty, :away_score, :away_penalty, :attendance, :venue, :round, :date, :host, :year)
  end
end
