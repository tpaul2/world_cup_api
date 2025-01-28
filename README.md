# World Cup API README

This is a lightweight Rails API that serves World Cup data.

Endpoints:
- /matches => lists all matches
- /matches/:id => list a specific match based on ID
- /teams => lists all teams/countries
- /teams/:id => list a specific team based on ID
- /teams/:id/home_matches => lists all home_matches for a given team based on ID
- /teams/:id/away_matches => lists all away_matches for a given team based on ID

* Ruby version
`ruby 3.3.6`
* Rails version
`Rails 8.0.1`

* Run team specs
`bundle exec rspec interview/world_cup_api/spec/requests/teams_spec.rb`

* Run match specs
`bundle exec rspec interview/world_cup_api/spec/requests/matches_spec.rb`
