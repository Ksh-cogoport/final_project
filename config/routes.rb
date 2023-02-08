Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # post "/articles", to: "articles#create"
  # post "/articles", to: "articles#update"
  # delete "/articles", to: "articles#destroy"

# 
  resources :articles, only: [:index, :show, :create, :update, :destroy]

  get "/categories", to: "categories#index"
  post "/categories", to: "categories#create"
  delete "/categories", to: "categories#delete"

#  
  resources :authors
  post "/auth/login", to: 'authentication#login'



  

  get "/article_categories", to:"article_categories#index"
end
