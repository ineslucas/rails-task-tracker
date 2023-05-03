Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 1️⃣ Show all checklists
  # get '/checklists', to: 'checklists#index'

  # 2️⃣ Create new checklist
  # get '/checklists/new', to: 'checklists#new'
  # post '/checklists', to: 'checklists#create'

  resources :checklists, only: [:index, :new, :create, :show]
end
