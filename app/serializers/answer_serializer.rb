class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :outcome
  has_one :game
  has_one :track
end
