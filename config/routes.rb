Rails.application.routes.draw do
  root "welcome#index"

  resources :foods do
  end
end
