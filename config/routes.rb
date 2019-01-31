Rails.application.routes.draw do
  root 'users#new'
  resources :users do
    collection do
      post :confirm
    end
  end
  
  resources :sessions
  
  resources :contributions do
    collection do
      post :confirm
    end
  end
end
