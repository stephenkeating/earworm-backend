class Playlist < ApplicationRecord
  has_many :tracks, dependent: :delete_all

  def high_scores
    Game.all.where.not(user: nil).where("playlist_id": self.id).sort_by { |game| -game.score}.map { |game| {user: game.user, score: game.score}}
  end

end
