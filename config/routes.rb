Rails.application.routes.draw do
  root to: 'store#index'
  resources :books
  resources :authors
  resources :categories
  get 'store/index'
  get 'cart/add/:id', to: 'cart#add_book', as: 'add_to_cart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
