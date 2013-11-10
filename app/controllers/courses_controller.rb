class CoursesController < ApplicationController

  def index
    @courses = User.find(params[:user_id]).courses
  end


  def show
     students = User.find(session[:user_id]).courses.find(params[:id]).students
     @students = students.uniq{ |student| student.id }
     @course = Course.find(params[:id])
     @user = User.first
  end

  def num_groups
    # binding.pry
    students = User.find(session[:user_id]).courses.find(params[:id]).students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    num_groups = params[:course][:num_of_groups].to_i
    Course.random(@students)
    @groups = Course.total_num_groups(num_students, num_groups, @students)
    render :groups
  end

  def groups
    students = User.find(session[:user_id]).courses.find(params[:id]).students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    students_per_group = params[:course][:num_per_group].to_i
    Course.random(@students)
    @groups = Course.total_students_groups(num_students, students_per_group, @students)
    
    render :groups
  end
end
