class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.integer :home_score
      t.integer :home_penalty
      t.integer :away_score
      t.integer :away_penalty
      t.integer :attendance
      t.string :venue
      t.string :round
      t.date :date
      t.string :host
      t.integer :year

      t.timestamps
    end
  end
end
