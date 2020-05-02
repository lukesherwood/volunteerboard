Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  resources :events
  resources :organisations 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
end
