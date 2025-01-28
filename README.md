# World Cup API README

This is a lightweight Rails API that serves World Cup data.

Endpoints:
- /matches => lists all matches
<img width="725" alt="Screenshot 2025-01-28 at 5 57 05 AM" src="https://github.com/user-attachments/assets/e676d93b-3f7c-47a0-820b-3e8ac99e64f4" />
- /matches/:id => list a specific match based on ID
<img width="733" alt="Screenshot 2025-01-28 at 5 58 11 AM" src="https://github.com/user-attachments/assets/c606a0ec-0dd4-4a54-a466-8da23314751e" />
- /teams => lists all teams/countries
<img width="732" alt="Screenshot 2025-01-28 at 5 58 51 AM" src="https://github.com/user-attachments/assets/09735e0f-19e2-47b7-aad1-6d8ddbeb0a28" />
- /teams/:id => list a specific team based on ID
<img width="707" alt="Screenshot 2025-01-28 at 5 59 29 AM" src="https://github.com/user-attachments/assets/e92f8878-ca08-4b7f-a926-908885b40934" />
- /teams/:id/home_matches => lists all home_matches for a given team based on ID
<img width="725" alt="Screenshot 2025-01-28 at 6 01 28 AM" src="https://github.com/user-attachments/assets/8b57fc55-62c7-4b77-b9c4-e94a3c55caed" />
- /teams/:id/away_matches => lists all away_matches for a given team based on ID
<img width="731" alt="Screenshot 2025-01-28 at 6 01 54 AM" src="https://github.com/user-attachments/assets/9109e3ea-3734-4a27-96ae-ada440d6cc96" />

* Ruby version
`ruby 3.3.6`
* Rails version
`Rails 8.0.1`

* Run team specs
`bundle exec rspec interview/world_cup_api/spec/requests/teams_spec.rb`

* Run match specs
`bundle exec rspec interview/world_cup_api/spec/requests/matches_spec.rb`
