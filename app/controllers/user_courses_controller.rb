class UserCoursesController < ApplicationController

  def index
    # if authenticated?
      @courses = User.find(current_user.id).courses
      render :index
    # else
    #   @login_error = "Please login."
    #   redirect_to root_path
    # end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(name: params[:course_title], user_id: current_user.id)

    redirect_to new_user_student_path({user_id: current_user.id, course_id: @course.id})
  end

  def edit
    @course = Course.find(params[:id])
    @all_students = @course.all_students
    @completed_assignments = @course.all_completed_assignments_for_course

  end

  def update
    @sa = StudentAssignment.find(params[:student_assignment][:id])
    @course_id = Assignment.find(@sa.assignment_id).course_id
    @sa.update_attribute(:grade, params[:student_assignment][:grade])
    redirect_to ("/users/#{params[:user_id]}/user_courses/#{params[:id]}/edit")
  end

end
