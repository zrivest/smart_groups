class CoursesController < ApplicationController


  def edit
    @course = Course.find(params[:id])
    @all_students = @course.all_students
    @completed_assignments = @course.all_completed_assignments_for_course
  end


  
end
