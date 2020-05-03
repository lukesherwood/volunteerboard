Rails.application.routes.draw do
  
  devise_for :users
  resources :events do
    resources :jobs
  end
  resources :organisations 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
end
