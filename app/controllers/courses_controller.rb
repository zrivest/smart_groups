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
    students = User.find(session[:user_id]).courses.find(params[:id]).students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    num_groups = params[:course][:num_of_groups].to_i
    
    if params[:course][:random].to_i == 1
      Course.random(@students)
      @groups = Course.total_num_groups(num_students, num_groups, @students)
    end

    if params[:course][:even_grade_distribution].to_i == 1
      Course.average(@students)
      @groups = Course.total_num_even_groups(num_students, num_groups, @students)
    end

    render :groups
  end


  def groups
    students = User.find(session[:user_id]).courses.find(params[:id]).students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    students_per_group = params[:course][:num_per_group].to_i
    
    if params[:course][:random].to_i == 1
      Course.random(@students)
      @groups = Course.total_students_groups(num_students, students_per_group, @students)
    end

    if params[:course][:even_grade_distribution].to_i == 1
      Course.average(@students)
      @groups = Course.total_students_even_groups(num_students, students_per_group, @students)
    end

    render :groups
  end
end
