class CoursesController < ApplicationController

  def show
     @students = Student.all.shuffle
     @generator = Generator.new
     @course = Course.find(params[:id])
     @user = User.first
  end


  def num_groups
    # binding.pry
    @students = Student.all
    num_students = Student.all.length
    num_groups = params[:course][:num_of_groups].to_i
    Course.random(@students)
    @groups = Course.total_num_groups(num_students, num_groups, @students)
    
    render :groups
  end

  def groups
    @students = Student.all
    num_students = Student.all.length
    students_per_group = params[:course][:num_per_group].to_i
    Course.random(@students)
    @groups = Course.total_students_groups(num_students, students_per_group, @students)
    render :groups
  end


end



