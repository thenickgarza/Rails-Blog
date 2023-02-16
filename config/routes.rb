Rails.application.routes.draw do
   resources :users do 
      resources :people
  end
  resources :posts do 
    resources :comments
  end

  get "users/:id" => "users#show"
 
  get 'home/index'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
