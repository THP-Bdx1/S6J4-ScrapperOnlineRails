Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post 'home/index', to: 'home#create'
  get 'home/:id', to: 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
