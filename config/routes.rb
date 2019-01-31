Rails.application.routes.draw do
  resources :sessions
  root 'users#new'
  resources :users do
    collection do
      post :confirm
    end
  end
  
end
