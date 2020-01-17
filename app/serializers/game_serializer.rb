class GameSerializer < ActiveModel::Serializer
  attributes :id, :user
  has_many :answers
end
