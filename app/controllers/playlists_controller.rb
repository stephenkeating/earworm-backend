class PlaylistsController < ApplicationController

  def index
    # post-mvp: exclude skits (or maybe do that in front-end if at all)
    @playlists = Playlist.all
    render json: @playlists, include: "**"
  end

  def show
    @playlist = Playlist.find(params[:id])
    render json: @playlist
  end

end
