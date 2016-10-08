Rails.application.routes.draw do
  resources :reservations
  resources :executions
  resources :shops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
