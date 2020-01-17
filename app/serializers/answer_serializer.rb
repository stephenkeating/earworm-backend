class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :outcome, :game_id
  # has_one :game
  has_one :track
end
