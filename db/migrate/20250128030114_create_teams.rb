class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :country
      t.string :abbreviation
      t.string :team_association

      t.timestamps
    end
  end
end
