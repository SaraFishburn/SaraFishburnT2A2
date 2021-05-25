Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    root to: 'registrations#index'
    get '/users', to: 'registrations#index'
    get '/users/:id', to: 'registrations#show'
  end

  # resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
