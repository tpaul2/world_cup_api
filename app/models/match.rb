class Match < ApplicationRecord
  # this establishes the relationship between the team(country) & match
  belongs_to :home_country, class_name: "Team", foreign_key: "home_country_id", optional: true
  belongs_to :away_country, class_name: "Team", foreign_key: "away_country_id", optional: true

  before_validation :set_teams

  # since match creation is allowed, we want to validate the incoming data before it is persisted to the db
  validates :home_country_name, presence: true
  validates :away_country_name, presence: true
  validates :home_score, presence: true, numericality: true
  validates :home_penalty, numericality: { only_integer: true }, allow_nil: true
  validates :away_score, presence: true, numericality: true
  validates :away_penalty, numericality: { only_integer: true }, allow_nil: true
  validates :attendance, numericality: true
  validates :venue, presence: true
  validates :round, presence: true
  validates :date, presence: true
  validates :host, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1900, less_than_or_equal_to: Time.current.year }

  private

  def set_teams
    self.home_country = Team.find_by(abbreviation: home_country_name)
    self.away_country = Team.find_by(abbreviation: away_country_name)
  end
end
