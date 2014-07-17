class AlbumsController < ApplicationController
  def show
    @album = RSpotify::Album.find(params[:id])
  end
end
