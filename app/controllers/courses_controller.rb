class CoursesController < ApplicationController

  def index
    if authenticated?
      @courses = User.find(current_user.id).courses
      render :index
    else
      @login_error = "Please login."
      redirect_to root_path
    end
  end

  def new

  end

  def create
    @course = Course.create(name: params[:course_title], user_id: current_user.id)

    redirect_to new_user_student_path({user_id: current_user.id, course_id: @course.id})
  end

  def show
    if authenticated?
      students = User.find(current_user.id).courses.find(params[:id]).students
      @students = students.uniq{ |student| student.id }
      @course = Course.find(params[:id])
      session[:course_id] = @course.id
      @user = current_user.id
    else
      @login_error = "Please login."
      redirect_to root_path
    end
  end

  def num_groups
    students = User.find(current_user.id).courses.find(params[:id]).students
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
    students = User.find(current_user.id).courses.find(params[:id]).students
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

    if authenticated?
    render :groups
    else
      @login_error = "Please login."
      redirect_to root_path
    end
  end
end
