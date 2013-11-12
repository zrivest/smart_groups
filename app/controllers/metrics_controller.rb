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

    # @chart = LazyHighCharts::HighChart.new('column') do |f|
    #   f.title({ text: "#{@course.name}"})
    #   f.options[:chart][:defaultSeriesType] = "column"
    #   f.plot_options({:column=>{:stacking=>"percent"}})
    #   @completed_assignments.each do |student_assignment|
    #     grades = student_assignment.student.get_grades
    #     @full_name = student_assignment.student.name
    #     @graph.plots << Plot.create(data: grades)
    #     f.series(name: student_assignment.student.name, data: grades)
    #   end
    # end
    # render :show

    @categories = Array.new
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # f.title({ :text=>@course.name})
      @completed_assignments.each do |student_assignment|
        @categories << student_assignment.assignment.assignment_name
        grades = student_assignment.student.get_grades
          p grades
        f.series(:type=> "column",:name=> student_assignment.student.first_name,:data=> [grades])
      end
      # f.options[:xAxis][:categories] = @categories
       f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
      # p @categories
    end
    render :show
  end


    # @completed_assignments = @course.all_completed_assignments_for_course
    # @chart = LazyHighCharts::HighChart.new('graph') do |f|
    #     f.options[:xAxis][:categories] = ['Steve', 'Mary', 'Mark', 'Leslie', 'Maya']
    #     f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
    #     f.series(:type=>"column", :name=> "hello", :data=> [4, 3, 3, 9, 0])
    # end

  @chart = LazyHighCharts::HighChart.new('graph') do |f|
    f.title({ :text=>"Combination chart"})
    f.options[:xAxis][:categories] = []

    @completed_assignments.each do |assignment|
      f.series(:type=> 'column',:name=> assignment.student.first_name,:data=> assignment.student.get_grades)
      f.options[:xAxis][:categories] << assignment.assignment.assignment_name
    end

  end
    render :show
end


end

