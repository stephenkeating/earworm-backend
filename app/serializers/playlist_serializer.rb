class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id
  has_many :tracks
end
