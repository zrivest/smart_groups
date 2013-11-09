class MetricsController < ApplicationController

# "users/:user_id/courses/:course_id/metrics/:id"
  def main
    #from specific course metrics button on courses index page

    LazyHighCharts::HighChart

#column
  @chart = LazyHighCharts::HighChart.new('column') do |f|
  f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
  f.series(:name=>'Jane',:data=>[1, 3, 4, 3, 3, 5, 4,-46] )
  f.title({ :text=>"example test title from controller"})

  ### Options for Bar
  ### f.options[:chart][:defaultSeriesType] = "bar"
  ### f.plot_options({:series=>{:stacking=>"normal"}})

  ## or options for column
  f.options[:chart][:defaultSeriesType] = "column"
  f.plot_options({:column=>{:stacking=>"percent"}})
 end

  end

end
