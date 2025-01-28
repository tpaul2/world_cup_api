require 'rails_helper'
require 'json'
require 'byebug'

RSpec.describe "Matches", type: :request do
  describe "GET /matches" do
    it "lists all matches" do
      get matches_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /matches/:id" do
    it "retrieves a single match by ID" do
      get matches_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /matches" do
    let!(:home_team) { Team.create!(abbreviation: "USA") }
    let!(:away_team) { Team.create!(abbreviation: "BRA") }

    let(:valid_attrs) {
      { home_country_name: "USA",
        away_country_name: "BRA",
        home_score: 20,
        home_penalty: nil,
        away_score: 10,
        away_penalty: nil,
        attendance: 22344,
        venue: "The Park",
        round: "Final",
        date: "2024-12-18",
        host: "QAT",
        year: 2024
      }
    }
    it "creates a new match" do
      expect {
        post matches_path, params: { match: valid_attrs }
      }.to change(Match, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    context "when invalid attrs are passed" do
      let(:invalid_attrs) {
        {
          home_country_name: nil
        }
      }

      it "renders an error" do
        expect {
          post matches_path, params: { match: invalid_attrs }
        }.to_not change(Match, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("One or both teams could not be found.")
      end
    end
  end

  describe "PATCH/PUT /matches/1" do
    let(:valid_attrs) {
      { home_country_name: "USA",
        away_country_name: "ARG",
        home_score: 20,
        home_penalty: nil,
        away_score: 10,
        away_penalty: nil,
        attendance: 22344,
        venue: "The Park",
        round: "Final",
        date: "2024-12-18",
        host: "QAT",
        year: 2024
      }
    }
    let(:match) { Match.create!(valid_attrs) }

    it "updates an existing match" do
      patch match_path(match.id), params: { match: { home_country_name: "ARG", away_country_name: "USA" } }
      match.reload

      expect(response).to have_http_status(:ok)
      expect(match.home_country_name).to eq("ARG")
      expect(match.away_country_name).to eq("USA")
    end
  end
end
