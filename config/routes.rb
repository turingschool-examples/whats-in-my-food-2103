Rails.application.routes.draw do
  get '/foods', to: 'welcome#foods', as: 'foods'

  root "welcome#index"
end
