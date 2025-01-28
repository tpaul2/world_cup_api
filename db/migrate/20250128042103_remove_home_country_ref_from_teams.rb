class RemoveHomeCountryRefFromTeams < ActiveRecord::Migration[8.0]
  def change
    remove_column :teams, :home_country_id, :integer
  end
end
