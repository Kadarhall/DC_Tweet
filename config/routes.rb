Rails.application.routes.draw do







  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout' => 'sessions#destroy', :as => :signout


  resources :tweets do
    resource :like, module: :tweets
  end

  root to: "tweets#index"

  
end
