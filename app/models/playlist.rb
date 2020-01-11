class Playlist < ApplicationRecord
  has_many :tracks, dependent: :delete_all
end
