Rails.application.routes.draw do
  root 'website#index'

  get 'welcome/index'
  get '/login' => "website#login", as: "login"
  post '/logout' => "website#logout", as: "logout"

  resources :website, only: [:index] do
    collection do
      post :submit_login
    end
  end

end
