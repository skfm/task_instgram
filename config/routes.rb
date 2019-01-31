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
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :favorites
end
