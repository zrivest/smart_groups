SmartGroups::Application.routes.draw do

  root :to => 'welcome#index'

  resources :users do
    resources :courses
  end

  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'
end
