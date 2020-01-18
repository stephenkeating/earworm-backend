class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :user
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
