class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :high_scores
  has_many :tracks
end
