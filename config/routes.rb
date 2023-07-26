Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :photos, only: [:new, :create, :show] do
    resources :comments, only: [:create]
  end

  root to: 'photos#index'
end