class MetricsController < ApplicationController

  def main
    @course = Course.find(params[:course_id])


    session[:course_id] = @course.id


    @chart_types = [{id: 1, type: "column"}, {id: 2, type: "combo"}, {id: 3, type: "basic line"}]

  end

  def create
    @selections = params["chart_selections"]
    @course = Course.find(session[:course_id])

    @graph = Graph.create(course_id: session[:course_id])
    @completed_assignments = @course.all_completed_assignments_for_course

    @chart = LazyHighCharts::HighChart.new('column') do |f|
      f.title({ text: "#{@course.name}"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"percent"}})
      @completed_assignments.each do |student_assignment|
        grades = student_assignment.student.get_grades
        @full_name = student_assignment.student.name
        @graph.plots << Plot.create(data: grades)
        f.series(name: student_assignment.student.name, data: grades)
      end
    end
    render :show
  end
end

 #    @chart = LazyHighCharts::HighChart.new('graph') do |f|
 #  f.title({ :text=>"Combination chart"})
 #  f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
 #  f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
 #  f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
 #  f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
 #  f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
 #  f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
 #  f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
 #  f.series(:type=> 'pie',:name=> 'Total consumption',
 #  :data=> [
 #    {:name=> 'Jane', :y=> 13, :color=> 'red'},
 #    {:name=> 'John', :y=> 23,:color=> 'green'},
 #    {:name=> 'Joe', :y=> 19,:color=> 'blue'}
 #  ],
 #  :center=> [100, 80], :size=> 100, :showInLegend=> false)
 # end

 # render :show

