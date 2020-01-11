class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
    render json: @playlists, include: "**"
  end

  def show
    @playlist = Playlist.find(params[:id])
    render json: @playlist
  end

end
