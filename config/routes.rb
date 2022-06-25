Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users", :sessions => "sessions" }

  devise_for :users, skip: [:passswords, :sessions]
    as :user do
      get 'users/signin' => 'sessions#new'
      post 'users/signin' => 'sessions#create'
      get '/users/sign_out' => 'sessions#destroy', method: :delete
      post 'users/sign_up' => 'users#new', as: :new_user_registration_path
    end

  root to: 'pages#home'

  # resources :users

  resources :subjects

  resources :entries

  resources :groups

  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
