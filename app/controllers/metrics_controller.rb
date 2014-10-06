class MetricsController < ApplicationController

  def main
    @course = Course.find(params[:course_id])
    session[:course_id] = @course.id
    @chart_types = [{id: 1, type: "Each Student's Assignment Scores by Assignment"}, {id: 2, type: "Individual Student Performance by Assignment Due Date"}, {id: 3, type: "Class Average Assignment Scores by Due Date"}]
  end

  def create
    #graph attributes
    @selections = params['chart_selections']
    @course = Course.find(session[:course_id])
    @completed_assignments = @course.all_completed_assignments_for_course
    @categories = Array.new
    @range_categories = Array.new
    @class_averages = Array.new
    #series
    @hash = {}

    @completed_assignments.each do |student_assignment|
      #assignment name
      @categories << "#{student_assignment.assignment.assignment_name}"
      #due dates
      @range_categories << "#{student_assignment.assignment.due_date}"

      #assignment grade
      @student_grades = student_assignment.student.get_grades
      @class_averages << student_assignment.assignment.course_average
      @hash[student_assignment.student.name] = @student_grades
    end

    @class_average = get_average(@course.get_student_grades)

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>@course.name})
      @hash.each do |k,v|
        f.series(:type=> "column",:name=> "#{k}", :data=> v)
      end
      f.series(:type=> "spline",:name=> "#{@course.name} Mean", :data=> @class_averages.uniq!)
      f.options[:xAxis][:categories] = @categories.uniq!
      f.options[:legend][:layout] = "horizontal"
      f.labels(:items=>[:html=>"Student Test Grades", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
    end

    @chart_area = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "spline"
      @hash.each do |k,v|
        f.series(:type=> "spline",:name=> "#{k}", :data=> v, visible: false)
      end
      f.options[:chart][:inverted] = false
      f.options[:legend][:layout] = "horizontal"
      f.options[:xAxis][:categories] = @categories
      f.options[:legend][:layout] = "horizontal"
    end

    @chart_range = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "spline"
      f.series(:type=>"spline", :name=> "Class Average", :data=> @class_averages)
      f.options[:chart][:inverted] = false
      f.options[:legend][:layout] = "horizontal"
      f.options[:xAxis][:categories] = @range_categories.uniq!
    end

    if @selections == nil
      redirect_to main_path(session[:user_id],session[:course_id])
    else
      render :show
    end
  end


  def student_profile
   @student = Student.find(params[:student_id])
   @course = Course.find(session[:course_id])
   @student_name = @student.name
   @averages = Array.new
   @student_grades = []
   @axis_labels = Array.new
   @course_average_grades = Array.new
   @course_average = @course.get_student_grades
   @hash_student = Hash.new

   @course.completed_assignments_for(@student).each do |student_assignment|
    @axis_labels << student_assignment.assignment.assignment_name
    @student_grades << student_assignment.grade
    @averages << Float(@student_grades.inject(:+))/@student_grades.length
    @course_average_grades << student_assignment.assignment.course_average
  end
  @chart_student = LazyHighCharts::HighChart.new('graph') do |f|
    f.title({ :text=> @course.name})
    f.series(:type=> "spline",:name=> @student_name, :data=> @averages)
    f.series(:type=> "spline",:name=> "#{@course.name}", :data=> @course_average_grades)

    f.options[:xAxis][:categories] = @axis_labels
    f.options[:legend][:layout] = "horizontal"
    f.labels(:items=>[:html=>"#{@student_name}", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
  end
  render :student_profile
end

end





