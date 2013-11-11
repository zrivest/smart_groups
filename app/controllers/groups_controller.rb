class GroupsController < ApplicationController

  def new
    # if authenticated?
      students = Course.find(params[:course_id]).all_students
      @students = students.uniq{ |student| student.id }
      @course = Course.find(params[:course_id])
      session[:course_id] = @course.id
      @user = current_user.id
    # else
      # @login_error = "Please login."
      # redirect_to root_path
    # end
  end

  def create

    binding.pry
    new_group = Group.create(course_id: params[:course_id].to_i)
    params[:group][:group]
    
    p "333333333333333333333333333333333333333333333"
    p params
    # create a group
    # create many pods with that group id 
    # update student attribute pod id
    render :index
  end
  
  def total_students_per_groups
    students = Course.find(params[:course_id]).all_students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    students_per_group = params[:group][:total_students_per_groups].to_i
    
    if params[:group][:random].to_i == 1
      Group.random(@students)
      @groups = Group.total_students_groups(num_students, students_per_group, @students)
    end

    if params[:group][:even_grade_distribution].to_i == 1
      Group.average(@students)
      @groups = Group.total_students_even_groups(num_students, students_per_group, @students)
    end

    if authenticated?
    render :show
    else
      @login_error = "Please login."
      redirect_to root_path
    end
  end

  def total_num_of_groups
    # binding.pry
    students = Course.find(params[:course_id]).students
    @students = students.uniq{ |student| student.id }
    num_students = @students.length
    num_groups = params[:group][:total_num_of_groups].to_i
    if params[:group][:random].to_i == 1
      Group.random(@students)
      @groups = Group.total_num_groups(num_students, num_groups, @students)
    end

    if params[:group][:even_grade_distribution].to_i == 1
      Group.average(@students)
      p num_students
      p num_groups
      p @students
      @groups = Group.total_num_even_groups(num_students, num_groups, @students)
    end
    render :show
  end
end
