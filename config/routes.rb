Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
	resources :users
  root to: "posts#index"
	get "/signin", to: "sessions#new"
	post "/signin", to: "sessions#create"
end
