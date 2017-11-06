class MoviesController < ApplicationController

  def index
    movies = Movie.limit(200).select('id,name,year,genre')
    render json: movies, status: 200
  end

end
