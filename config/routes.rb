Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/recent_rented_movies' => 'movies#index', as: :recent_rented_movies

end
