Rails.application.routes.draw do
  resources :items
  resources :invoices
    
      resources :people do
      resources :phone_numbers
      resources :addresses
      end
  
  resources :posts do 
    resources :comments
  end

  resources :profile
  resources :invoices


  get "users/:id" => "users#show"
 
  get 'home/index'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
end
