class GroupsController < ApplicationController

  def new
    session[:course_id] = Course.find(params[:course_id]).id

    @students = current_course.unique_students
    @course = current_course
    @user = current_user.id

  end

  def create
    binding.pry
    params[:group][:new_group].to_i
    render :index
  end
  
  def total_students_per_groups
    @students = current_course.unique_students
    num_students = @students.length
    students_per_group = params[:group][:total_students_per_groups].to_i
    
    if params[:group][:random].to_i == 1
      Group.random(@students)
      @groups = Group.total_students_groups(num_students, students_per_group, @students)
      p params
    end

    if params[:group][:even_grade_distribution].to_i == 1
      Group.average(@students)
      @groups = Group.total_students_even_groups(num_students, students_per_group, @students)
      


      @new_group = Group.create(course_id: params[:course_id].to_i)
      @groups.each do |pod|
        @pod = Pod.create(group_id: @new_group.id)  
        pod.each do |student|  
          StudentAssignment.find(student.id).update_attributes!(pod_id: @pod.id)    
        end  
      end  
    @groups
    end

    if authenticated?
    render :show
    else
      @login_error = "Please login."
      redirect_to root_path
    end
  end

  def total_num_of_groups
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
      @groups = Group.total_num_even_groups(num_students, num_groups, @students)
    end
    render :show
  end
end
