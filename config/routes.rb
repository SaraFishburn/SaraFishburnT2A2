Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    root to: 'registrations#index'
    get '/users', to: 'registrations#index'
    get '/users/:id', to: 'registrations#show', as: :users_show
  end

  resources :filaments, only: %i[create new destroy]
  resources :printers, only: %i[create new destroy]

  resources :users, only: [] do
    resources :reviews, only: %i[create new destroy]
  end

  resources :chatrooms, only: %i[show create] do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
