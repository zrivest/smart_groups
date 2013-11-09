class CoursesController < ApplicationController
  
  def index
    @students = Student.all
    
  end
end

