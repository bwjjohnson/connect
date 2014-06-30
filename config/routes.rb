Rails.application.routes.draw do
  root :to => "visitors#index"
  devise_for :users
  resources :users, :visitors
  post '/users/add', to: 'users#add'
end
