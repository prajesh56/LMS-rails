Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :'attendences'
  resources :'employees'
  resources :'leaverecords'
  resources :'home'

  get "/", to: "home#index"
  post "sign_in", to: "home#create"
  get "dashboard", to:"home#dashboard"
  delete "logout", to: "home#destroy"

 
end
