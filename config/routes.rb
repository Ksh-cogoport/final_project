Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # post "/articles", to: "articles#create"
  # post "/articles", to: "articles#update"
  # delete "/articles", to: "articles#destroy"

  # articles show all, show by id, create, update, delete 
  resources :articles, only: [:index, :show, :create, :update, :destroy]

  # get categories by article id
  get "/get_categories/:id", to: "articles#getcat"

  #  show all categories, add new categories.
  get "/categories", to: "categories#index"
  post "/categories", to: "categories#create"

  # 
  resources :authors

  #login using JWT
  post "/auth/login", to: 'authentication#login'

  #author_id to all articles
  get "/author_lists/:id", to:"authors#allarticles"

  #get articles by categories_id
  get "/get_articles/:id", to: "categories#get_art"


  # get "/article_categories", to:"article_categories#index"
end
