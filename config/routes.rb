Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :'attendences'
  resources :'employees'
  resources :'leaverecords'
  resources :'home'

  #get "/", to: "home#index"
  post "sign_in", to: "home#create"
  get "dashboard", to:"home#dashboard"
 
  get 'users', to:'home#users_list'
  get 'profile', to:'home#profile'
end
