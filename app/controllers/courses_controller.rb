class CoursesController < ApplicationController
  # get rid of all these unnecessary new lines everywhere -- please be deliberate

  def edit
    @course = Course.find(params[:id])
    @all_students = @course.all_students
    @completed_assignments = @course.all_completed_assignments_for_course
  end

  # get rid of all these unnecessary new lines everywhere -- please be deliberate

end
