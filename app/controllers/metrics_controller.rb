class MetricsController < ApplicationController

# "users/:user_id/courses/:course_id/metrics/:id"
  def main
    #from specific course metrics button on courses index page

    LazyHighCharts::HighChart

#column
  @course = current_course)
  @enrolled_students = current_course.students
  @chart = LazyHighCharts::HighChart.new('column') do |f|

   @enrolled_students.each do |student|
  f.series(:name=> student.name,:data=> student.get_grades)
  f.title({ :text=>"#{@course.name}"})

  ### Options for Bar
  ### f.options[:chart][:defaultSeriesType] = "bar"
  ### f.plot_options({:series=>{:stacking=>"normal"}})

  ## or options for column
  f.options[:chart][:defaultSeriesType] = "column"
  f.plot_options({:column=>{:stacking=>"percent"}})
 end

  end

end
