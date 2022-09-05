Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'log_in', sign_up: 'register'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "splash_page#index"

end
