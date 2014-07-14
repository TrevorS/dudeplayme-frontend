class SearchesController < ApplicationController

  def new
  end

  def create
    query   = params[:search][:query] if params[:search]
    types   = 'artist, album, track'
    results = RSpotify::Base.search(query, types)

    @artists  = prepare_results(results, RSpotify::Artist)
    @albums   = prepare_results(results, RSpotify::Album)
    @tracks   = prepare_results(results, RSpotify::Track)

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private
  def prepare_results(results, type)
    results.select { |r| r.class == type }.sort { |x, y| y.popularity <=> x.popularity }
  end
end
