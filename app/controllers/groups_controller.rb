class GroupsController < ApplicationController

  # the methods in this controller are fairly large
  # consider SRP here... Break out methods into succinct 
  # functionality, extract some of this code out to helpers
  
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
    num_students = @students.length
    students_per_group = params[:group][:total_students_per_groups].to_i

    if params[:group][:even_grade_distribution].to_i == 1
      Group.average(@students)
      @groups = Group.total_students_even_groups(num_students, students_per_group, @students)
      group_pod_creation(@groups, params[:course_id])
    elsif params[:group][:random].to_i == 1
      Group.random(@students)
      @groups = Group.total_students_groups(num_students, students_per_group, @students)
      @new_group = Group.create(course_id: params[:course_id].to_i)
      @groups.each do |pod|
        @pod = Pod.create(group_id: @new_group.id)
        pod.each do |student|
          StudentAssignment.find(student.id).update_attributes!(pod_id: @pod.id)
        end
      end
    else
      redirect_to new_course_group_path(current_course)
    end
    @groups
    render :show
  end

  def total_num_of_groups
    @students = current_course.unique_students
    @course_id = params[:course_id]
    num_students = @students.length
    num_groups = params[:group][:total_num_of_groups].to_i

    if params[:group][:even_grade_distribution].to_i == 1
      Group.average(@students)
      @groups = Group.total_num_even_groups(num_students, num_groups, @students)
      group_pod_creation(@groups, params[:course_id])
    elsif params[:group][:random].to_i == 1
      Group.random(@students)
      @groups = Group.total_num_groups(num_students, num_groups, @students)
      group_pod_creation(@groups, params[:course_id])
    else
      redirect_to new_course_group_path(current_course)
    end
    render :show
  end

  def update_through_ajax
    pod_id = params[:pod_id]
    student_id = params[:student_id]
    StudentAssignment.find(student_id).update_attribute(:pod_id, pod_id)
    render nothing: true
  end
end
