class AddHomeAndAwayCountryIdsToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :home_country_id, :integer
    add_column :matches, :away_country_id, :integer
  end
end
