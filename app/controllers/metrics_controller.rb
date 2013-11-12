class MetricsController < ApplicationController

  def main
    @course = Course.find(params[:course_id])
    session[:course_id] = @course.id
    @chart_types = [{id: 1, type: "column"}, {id: 2, type: "combo"}, {id: 3, type: "basic line"}]

  end

  def create
    @selections = params["chart_selections"]
    @course = Course.find(session[:course_id])

  @course.all_completed_assignments_for_course
    @average_grades
    end
    render :show
  end
end

