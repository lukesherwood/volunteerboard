Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  
  resources :organisations, param: :slug do
    resources :events, only: [:index] # greenpeace/events
    resources :jobs, only: [:index] # greenpeace/jobs
  end

  resources :events do
    resources :jobs #monday_janboree/jobs/1/edit..
  end

  resources :jobs, only: [:index]

  get 'jobs/available', to: 'jobs#index_available'
  

  root to: "welcome#home"

  

end




