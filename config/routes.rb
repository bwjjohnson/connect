Rails.application.routes.draw do
  resources :email_templates
  resources :statuses
  root :to => "visitors#index"
  devise_for :users
  scope "/admin" do
    resources :users
  end
  get '/visitors/created', to: 'visitors#created'
  resources :visitors
end
