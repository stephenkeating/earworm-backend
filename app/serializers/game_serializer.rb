class GameSerializer < ActiveModel::Serializer
  attributes :id, :user, :playlist_id, :score
  has_many :answers
end
