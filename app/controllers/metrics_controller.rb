class MetricsController < ApplicationController

  def main
    @course = Course.find(params[:course_id])


    session[:course_id] = @course.id


    @chart_types = [{id: 1, type: "column"}, {id: 2, type: "combo"}, {id: 3, type: "basic line"}]

  end

  def create
    @selections = params["chart_selections"]
    p params

    @graph = Graph.create(course_id: session[:course_id])
    @enrolled_students = Course.find(session[:course_id]).students

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      @enrolled_students.each do |student|
        @graph << Series.create(data: student.get_grades)
        f.series(name: student.name, data: student.get_grades)
        f.title({ text: "#{@course.name}"})
        f.options[:chart][:defaultSeriesType] = "column"
        f.plot_options({:column=>{:stacking=>"percent"}})
      end
    end
    render :show
  end
end
