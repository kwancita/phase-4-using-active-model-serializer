Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/movies/:id/summary', to: 'movies#summary'
  # app/controllers/movies_controller.rb
  def summaries
    movies = Movie.all
    render json: movies, each_serializer: MovieSummarySerializerSerializer
  end
end
