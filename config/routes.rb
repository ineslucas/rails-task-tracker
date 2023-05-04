Rails.application.routes.draw do
  devise_for :users
  root to: "checklists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # 1️⃣ Show all checklists
  # get '/checklists', to: 'checklists#index'

  # 2️⃣ Create new checklist
  # get '/checklists/new', to: 'checklists#new'
  # post '/checklists', to: 'checklists#create'

  resources :checklists, only: [:index, :new, :create, :show] do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy, :show] do # only missing index
    # In contrast, a collection route acts on the entire collection of resources, rather than on a specific member. For example, a new or index action in a controller usually acts on the entire collection of resources, rather than a specific member of that collection.
      member do
        patch :completed
      end
    end
  end

end
