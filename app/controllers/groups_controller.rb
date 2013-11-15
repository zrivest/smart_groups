class GroupsController < ApplicationController

  def new
    session[:course_id] = Course.find(params[:course_id]).id
    @students = current_course.unique_students
    @user = current_user.id
  end

  def create
    render :index
  end

  def total_students_per_groups
    @students = current_course.unique_students
    @course_id = params[:course_id]
    # @groups = Group.create_groups_by_number_of_students(@students, params[:group])
    # @pods = group_pod_creation(@groups, @course_id)
    @generator = GroupGenerator.new(@course_id, params[:group])
    @generator.distribute(@students)

    if generator.save
      render :show
    else
      # @generator.errors.full_messages
      render :new
    end

    # render :show
  end

  def total_num_of_groups
    # @students = current_course.unique_students
    # @course_id = params[:course_id]
    # @groups = Group.create_groups_by_number_of_groups(@students, params[:group])
    # @pods = group_pod_creation(@groups, @course_id)

    @students = current_course.unique_students
    @course_id = params[:course_id]
    @generator = GroupGenerator.new(@course_id, params[:group])
    @generator.distribute(@students)

    if generator.save
      render :show
    else
      # @generator.errors.full_messages
      render :new
    end


    # render :show
  end

  def update_through_ajax
    pod_id = params[:pod_id]
    student_id = params[:student_id]
    StudentAssignment.find(student_id).update_attribute(:pod_id, pod_id)
    render nothing: true
  end
end
