Rails.application.routes.draw do
  resources :suppliers do 
    collection do 
     get 'authenticate'
     get 'oauth_callback'
    end
  end

root 'suppliers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
