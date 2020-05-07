Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  
  resources :organisations, param: :slug do
    resources :events, only: [:index] # greenpeace/events
    resources :jobs, only: [:index] # greenpeace/jobs
  end

  resources :events do
    resources :jobs #monday_janboree/jobs/1/edit..
  end

  get '/jobs', to: 'jobs#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"

  

end




