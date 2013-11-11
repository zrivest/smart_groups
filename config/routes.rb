SmartGroups::Application.routes.draw do
  root :to => 'welcome#index'

  get '/students_grades' => 'teachers#students_grades'
  get "users/:user_id/courses/:course_id/metrics/:id" => "metrics#main", :as => :main
  resources :metrics
  resources :user_sessions

  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'


  resources :users do
    resources :students
  end
  
  post '/courses/:course_id/groups/total_students_per_groups' => "groups#total_students_per_groups"
  post '/courses/:course_id/groups/total_num_of_groups' => "groups#total_num_of_groups"

  resources :courses do
    resources :groups 

  end

  resources :users do
    resources :courses, only: [:index, :new, :create] , controller: "user_courses"
   end
  post '/login' => 'user_sessions#login'
  get '/logout' => 'user_sessions#logout'
  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'

end
