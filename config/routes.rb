Rails.application.routes.draw do


  root 'home#show'




  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout' => 'sessions#destroy', :as => :signout

  resources :tweets
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]


  
end
