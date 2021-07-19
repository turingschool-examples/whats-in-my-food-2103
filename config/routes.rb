Rails.application.routes.draw do
  root "welcome#index"
  get '/foods', to: 'foods#search_results'
end
