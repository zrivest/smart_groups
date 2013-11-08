SmartGroups::Application.routes.draw do
  # get 'welcome/index'
  root :to => 'courses#index'
  # get '/students_grades' => 'teachers#students_grades'
end
