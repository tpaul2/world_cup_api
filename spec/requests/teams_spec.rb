require 'rails_helper'

RSpec.describe "Teams", type: :request do
  let!(:team) { Team.create!(country: "United States", abbreviation: "USA") }
  let!(:home_match) {
    Match.create!(
      home_country_name: "USA",
      away_country_name: "BRA",
      home_score: 2,
      away_score: 1,
      attendance: 100,
      venue: "Backyard",
      round: "First Round",
      date: "2024-01-23",
      host: "QAT",
      year: 2024
    )
  }
  let!(:away_match) {
    Match.create!(
      home_country_name: "BRA",
      away_country_name: "USA",
      home_score: 1,
      away_score: 3,
      attendance: 100,
      venue: "Backyard",
      round: "First Round",
      date: "2025-01-23",
      host: "QAT",
      year: 2025
    )
  }


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
      expect(response.body).to include("home_matches")
    end
  end

  describe "GET /teams/:id/away_matches" do
    it "renders the away_matches for team by ID" do
      get away_matches_team_path(id: 1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("away_matches")
    end
  end
end
