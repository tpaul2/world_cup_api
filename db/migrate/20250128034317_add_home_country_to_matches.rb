class AddHomeCountryToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :home_country, :string
  end
end
