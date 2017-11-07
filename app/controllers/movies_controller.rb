
# Simple service to serve up fake movies to test Movie Queue Services
class MoviesController < ApplicationController
  rescue_from StandardError, with: :return_service_error

  def index
    if params[:ids]
      ids = params[:ids].split(',')
      movies = Movie.where('id' => ids).select('id,name,year,genre')
      if movies.size != ids.size
        render json: { message: 'Movie not found' }, status: :not_found
        return
      end
    else
      movies = Movie.limit(200).select('id,name,year,genre')
    end
    render json: movies, status: 200
  end

  def show
    movie = Movie.where(['id = ?', params[:id]]).select('id,name,year,genre').first
    if movie.nil?
      render json: { message: 'Movie not found' }, status: :not_found
    else
      render json: movie, status: 200
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: error.message }, status: :bad_request
  end



  private

  def return_service_error(error)
    print error.backtrace.join("\n")
    render json: { message: error.message }, status: :internal_server_error
  end

end
