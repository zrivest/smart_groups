class StudentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id].to_i)
  end

  def create
    course = Course.find(params[:users][:students][:course])

    s = Student.create(first_name: params[:users][:students][:first_name], last_name: params[:users][:students][:last_name])
    a = Assignment.create(assignment_name: params[:users][:students][:assignment_name], start_date: params[:users][:students][:start_date], due_date: params[:users][:students][:due_date], course_id: course.id)

    StudentAssignment.create(student_id: s.id, assignment_id: a.id, grade: params[:users][:students][:grade].to_i)
    Enrollment.create(student_id: s.id, course_id: course.id)

    redirect_to new_user_student_path({user_id: params[:user_id], course_id: course.id})
  end

  def destroy
    sa = StudentAssignment.find(params[:id])
    course_id = Assignment.find(sa.assignment_id).course_id
    sa.destroy
    redirect_to ("/users/#{params[:user_id]}/user_courses/#{course_id}/edit")
  end
end