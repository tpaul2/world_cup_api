require 'rails_helper'

RSpec.describe "Teams", type: :request do
  let!(:team) { Team.create!(id: 1, country: "team name") }

  describe "GET /teams/:id" do
    it "retrieves a single match by ID" do
      get teams_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /teams/:id/home_matches" do
    it "renders the home_matches for team by ID" do
      get home_matches_team_path(id: 1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("team name")
    end
  end

  describe "GET /teams/:id/away_matches" do
    it "renders the away_matches for team by ID" do
      get away_matches_team_path(id: 1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("team name")
    end
  end
end
