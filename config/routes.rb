Rails.application.routes.draw do
  resources :tenants
  resources :suppliers do 
  end

  get '/auth/quickbooks', to: 'sessions#authenticate'
  get '/auth/quickbooks/callback', to: 'sessions#oauth_callback'

  post '/webhooks', to: 'suppliers#webhooks'
  
root 'suppliers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
