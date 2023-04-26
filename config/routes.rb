Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "home#index"

  resources :books

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end
end
