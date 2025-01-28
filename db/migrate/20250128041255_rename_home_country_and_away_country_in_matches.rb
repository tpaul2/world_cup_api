class RenameHomeCountryAndAwayCountryInMatches < ActiveRecord::Migration[8.0]
  def change
    rename_column :matches, :home_country, :home_country_name
    rename_column :matches, :away_country, :away_country_name
  end
end
