class SearchesController < ApplicationController

  def new
  end

  def create
    @tracks = RSpotify::Track.search(params[:search][:query]).sort { |x, y| y.popularity <=> x.popularity }
  end
end
