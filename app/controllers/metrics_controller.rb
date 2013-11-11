class MetricsController < ApplicationController

  def main

    @course = Course.find(params[:course_id])

    session[:course_id] = @course.id

    @enrolled_students = Course.find(session[:course_id]).students

    @chart_types = [{id: 1, type: "column"}, {id: 2, type: "combo"}, {id: 3, type: "basic line"}]

  end
end

def create
  @selections = params["chart_selections"]
  p params

  @chart = LazyHighCharts::HighChart.new('column') do |f|
    @enrolled_students.each do |student|
      f.series(name: student.name, data: student.get_grades)
      f.title({ text: "#{@course.name}"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"percent"}})

      redirect_to metric_path()
    ### Options for Bar
    ### f.options[:chart][:defaultSeriesType] = "bar"
    ### f.plot_options({:series=>{:stacking=>"normal"}})
  end

end


end
