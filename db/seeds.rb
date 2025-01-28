# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Load the teams data from the CSV file
team_csv_text = File.read(Rails.root.join('lib', 'tasks', 'world_cup_countries_by_team.csv'))
team_csv = CSV.parse(team_csv_text, headers: true, encoding: 'utf-8')
team_csv.each do |row|
  t = Team.new
  t.country = row['team']
  t.abbreviation = row['team_code']
  t.team_association = row['team_association']
  t.save
end

# Load the match data from the CSV file
match_csv_text = File.read(Rails.root.join('lib', 'tasks', 'world_cup_matches.csv'))
match_csv = CSV.parse(match_csv_text, headers: true, encoding: 'utf-8')
match_csv.each do |row|
  home_team = Team.find_by(abbreviation: row['home_country'])
  away_team = Team.find_by(abbreviation: row['away_country'])

  if home_team && away_team
    m = Match.new
    m.home_country_id = home_team.id
    m.away_country_id = away_team.id
    m.home_country_name = row['home_country']
    m.away_country_name = row['away_country']
    m.home_score = row['home_score']
    m.home_penalty = row['home_penalty']
    m.away_score = row['away_score']
    m.away_penalty = row['away_penalty']
    m.attendance = row['attendance']
    m.venue = row['venue']
    m.round = row['round']
    m.date = row['date']
    m.host = row['hosts']
    m.year = row['year']
    m.save
  else
    puts "Could not find teams for match: #{row.inspect}"
  end
end
 