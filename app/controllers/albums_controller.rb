class AlbumsController < ApplicationController
  def show
    @album = RSpotify::Album.find(params[:id])
    @tracks = @album.tracks
    @artists = @album.artists
  end
end
