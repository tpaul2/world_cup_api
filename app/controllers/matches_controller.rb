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
    @match = Match.new(match_params)

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
    params.expect(match: [ :home_country_name, :away_country_name, :home_score, :home_penalty, :away_score, :away_penalty, :attendance, :venue, :round, :date, :host, :year ])
  end
end
