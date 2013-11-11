SmartGroups::Application.routes.draw do
  root :to => 'welcome#index'

  # get '/students_grades' => 'teachers#students_grades'

  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'

  resources :metrics
  resources :user_sessions
  get "users/:user_id/courses/:course_id/metrics/new" => "metrics#main", :as => :main
  post "/metrics", to: 'metrics#create'


  resources :users do
    resources :students
    resources :courses do
      put 'num_groups', on: :member
      put 'groups', on: :member
    end
  end

  post '/login' => 'user_sessions#login'
  get '/logout' => 'user_sessions#logout'
  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'

end
