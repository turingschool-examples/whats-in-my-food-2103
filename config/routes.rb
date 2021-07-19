Rails.application.routes.draw do
  root "welcome#index"
  resources :foods, only: [:index]
  post '/search', to: 'foods#search'

end
