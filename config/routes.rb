Rails.application.routes.draw do
  root "lists#index"



  resources :lists do
    resources :tasks
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    devise_scope :users do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
