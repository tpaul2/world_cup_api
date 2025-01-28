class AddAwayCountryToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :away_country, :string
  end
end
