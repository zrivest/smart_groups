SmartGroups::Application.routes.draw do
  root :to => 'welcome#index'

  get '/students_grades' => 'teachers#students_grades'
  get "users/:user_id/courses/:course_id/metrics/:id" => "metrics#main", :as => :main
  resources :metrics
  resources :user_sessions

  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'
  resources :metrics
  resources :user_sessions
  get "users/:user_id/courses/:course_id/metrics/new" => "metrics#main", :as => :main
  post "/metrics", to: 'metrics#create'

  resources :users do
    resources :students
  end

  post '/courses/:course_id/groups/total_students_per_groups' => "groups#total_students_per_groups"
  post '/courses/:course_id/groups/total_num_of_groups' => "groups#total_num_of_groups"
  post '/courses/:course_id/groups/:id/update_through_ajax' => 'groups#update_through_ajax'

  resources :courses do
    resources :groups

  end

  resources :users do
    resources :courses, only: [:index, :new, :create, :update] , controller: "user_courses"
   end

  post '/login' => 'user_sessions#login'
  get '/logout' => 'user_sessions#logout'
  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'
  get "/users/:user_id/user_courses/:id/edit" => "user_courses#edit", :as => :edit
  put "/users/:user_id/user_courses/:id/edit" => "user_courses#update", :as => :update
end
