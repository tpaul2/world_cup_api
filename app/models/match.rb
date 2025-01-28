class Match < ApplicationRecord
  belongs_to :home_country, class_name: "Team", foreign_key: 'home_country_id', optional: true
  belongs_to :away_country, class_name: "Team", foreign_key: 'away_country_id', optional: true
end
