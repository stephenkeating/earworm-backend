class TrackSerializer < ActiveModel::Serializer
  attributes :id, :spotify_id, :artists, :name, :preview_url, :playlist_id
end
