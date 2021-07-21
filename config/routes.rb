Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tests#index'

  # resources :tests

  resources :tests do
    resources :questions, shallow: true
  end

  # /tests/backend/ruby
  #get '/tests/:category/:title', to: 'tests#search', level: 2


  #resource :account
  #resource :account, controller: :account
  #resources :tests, only: %i[index show]
  

  # resources :tests do
  #   resources :questions, shallow: true
  # end

  # resources :tests do
  #   get :beginner, on: :collection

  #   member do
  #     post :start
  #   end
  # end

  #get '/tests', to: 'tests#index'
  # get '/tests/:id/start', to: 'tests#start'
  # get '/tests/:id/start', to: 'tasks#start'
end
