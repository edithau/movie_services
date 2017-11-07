Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, only: [:show, :index]
  get '/popular_movies' => 'movies#index', as: :popular_movies

end
