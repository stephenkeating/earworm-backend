class GameSerializer < ActiveModel::Serializer
  attributes :id, :user, :playlist_id
  has_many :answers
end
