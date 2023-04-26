Rails.application.routes.draw do
  root "home#index"

  resources :books
  resources :lend_books

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end
end
