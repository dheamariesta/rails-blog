Rails.application.routes.draw do
  resources :articles
  resources :users
  # resources :users
  root 'welcome#index'

  get '/signup' => 'users#new'
  post '/create' => 'users#create'
  # get '/delete' => 'users#destroy'
  # post '/deleteaccount' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/account' => 'users#edit'

  get '/favourite' => 'users#add_favourite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
