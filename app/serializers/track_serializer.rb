class TrackSerializer < ActiveModel::Serializer
  attributes :id, :spotifyAlbum, :spotifyArtists, :spotifyDurationMs, :spotifyHref, :spotifyId, :spotifyName, :spotifyPopularity, :spotifyPreviewUrl, :spotifyUri, :playlist_id
end
