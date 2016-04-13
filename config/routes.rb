Rails.application.routes.draw do
  resources :tools,  only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users,  only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :categories,  only: [:index, :show, :new, :create, :destroy]

  root 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
