class Game < ApplicationRecord
  has_many :answers, dependent: :delete_all

  def score 
    self.answers.where(outcome: 'Earworm!').count
  end

end
