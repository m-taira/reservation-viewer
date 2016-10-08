Rails.application.routes.draw do
  resources :reservations
  resources :executions
  resources :shops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'reservations/auto/daily/:date', to: 'reservations#daily', as: :auto_daily
  get 'reservations/auto/shop/:id', to: 'reservations#shop', as: :auto_shop

  root 'reservations#daily'
end
