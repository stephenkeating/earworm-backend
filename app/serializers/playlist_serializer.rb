class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :displayName, :spotifyName, :spotifyDescription, :spotifyId, :spotifyUri
  has_many :tracks
end
