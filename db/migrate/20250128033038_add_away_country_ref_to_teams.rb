class AddAwayCountryRefToTeams < ActiveRecord::Migration[8.0]
  def change
    add_reference :teams, :away_country, null: false, foreign_key: { to_table: :matches }
  end
end
