class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :displayName
      t.string :spotifyName
      t.string :spotifyDescription
      t.string :spotifyId
      t.string :spotifyUri

      t.timestamps
    end
  end
end
