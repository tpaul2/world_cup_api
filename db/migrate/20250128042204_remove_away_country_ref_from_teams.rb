class RemoveAwayCountryRefFromTeams < ActiveRecord::Migration[8.0]
  def change
    remove_column :teams, :away_country_id, :integer
  end
end
