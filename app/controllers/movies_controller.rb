class MoviesController < ApplicationController

  def index

    if params[:ids]
      ids = params[:ids].split(',')
      movies = Movie.where('id' => ids).select('id,name,year,genre')
    else
      movies = Movie.limit(200).select('id,name,year,genre')
    end
    render json: movies, status: 200
  end

  def show
    movies = Movie.where(['id = ?', params[:id]]).select('id,name,year,genre').first
    render json: movies, status: 200
  end


end
