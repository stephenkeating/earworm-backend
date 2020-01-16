class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :artists
      t.string :spotify_id
      t.string :name
      t.string :preview_url
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
