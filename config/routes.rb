Rails.application.routes.draw do

  get '/locations/show', to: 'locations#show', as: 'temp'
  root to: 'locations#index'
  #resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
