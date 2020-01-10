class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :spotifyAlbum
      t.string :spotifyArtists
      t.string :spotifyDurationMs
      t.string :integer
      t.string :spotifyHref
      t.string :spotifyId
      t.string :spotifyName
      t.integer :spotifyPopularity
      t.string :spotifyPreviewUrl
      t.string :spotifyUri
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
