Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users
  resources :maps do
    resource :pages, only: [:new, :create]
  end
  
  resources :pages, except: [:create, :new]
  post 'mail_send', to: 'maps#mail_send'


end
