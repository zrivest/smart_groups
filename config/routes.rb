SmartGroups::Application.routes.draw do
  # get 'welcome/index'
  root :to => 'welcome#index'
  # get '/students_grades' => 'teachers#students_grades'
  resources :users do
    resources :courses
  end

  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
end
