class MetricsController < ApplicationController

  # the methods in this controller are fairly large
  # Specifically create
  # consider SRP here... Break out methods into succinct 
  # functionality, extract some of this code out to helpers
  
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
    #series
    @student_names = Array.new
    @student_averages = Array.new
    #temporary capsule, to use Graph, Series objects
    @hash = {}
    @hash2 = {}

    @completed_assignments.each do |student_assignment|
      @categories << "#{student_assignment.assignment.assignment_name}"
      @range_categories << "#{student_assignment.assignment.due_date}"
      #assignment name
      @student_names << student_assignment.student.first_name
      #assignment grade
      @student_grades = student_assignment.student.get_grades
      @student_averages << get_average(@student_grades)
      # @class_averages << get_average(@student_grades)
      @hash[student_assignment.student.name] = @student_grades
      @hash2[:average] = @student_averages
    end

    @class_average = get_average(@course.get_student_grades)

      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>@course.name})
        @hash.each do |k,v|
          f.series(:type=> "column",:name=> "#{k}", :data=> v)
        end
        f.options[:xAxis][:categories] = @categories
        f.options[:legend][:layout] = "horizontal"
        f.labels(:items=>[:html=>"Student Test Grades", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
      end
      @chart_area = LazyHighCharts::HighChart.new('graph') do |f|
        f.options[:chart][:defaultSeriesType] = "spline"
        @hash.each do |k,v|
          f.series(:type=> "spline",:name=> "#{k}", :data=> v)
        end
        f.options[:chart][:inverted] = false
        f.options[:legend][:layout] = "horizontal"
        f.options[:xAxis][:categories] = @categories
        f.options[:legend][:layout] = "horizontal"
      end
      @chart_range = LazyHighCharts::HighChart.new('graph') do |f|
        f.options[:chart][:defaultSeriesType] = "spline"
        @hash2.each do |k,v|
          f.series(:type=> "spline",:name=> "#{k}", :data=> v)
        end
        f.series(:type=>"spline", :name=> "Class Average", :data=> @class_average)
        f.options[:chart][:inverted] = false
        f.options[:legend][:layout] = "horizontal"
        f.options[:xAxis][:categories] = @range_categories
      end
      render :show
    end



    def student_profile
      @student = Student.find(params[:student_id])
      @course = Course.find(session[:course_id])
      @student_name = @student.name
      @student_average = Array.new
      @axis_labels = Array.new
      @course_average = @course.get_student_grades
      @student_grade_array = @student.student_assignments.map{|student_assignment| student_assignment.grade}
      @hash_student = Hash.new
      @hash_student[@student_name] = @student_grade_array

      @student.assignments.each do |assignment|

      @axis_labels << "#{assignment.assignment_name}"
      @student_average << get_average(@student_grade_array)

      @hash_student_average = {:average => @student_average }
    end

    @chart_student = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=> @course.name})
      @hash_student.each do |k,v|
        f.series(:type=> "spline",:name=> "#{k}", :data=> v)
      end
      f.series(:type=> "spline",:name=> "Score Average", :data=> @student_average)
      f.series(:type=> "line",:name=> "#{@course.name}", :data=> @course_average)

      f.options[:xAxis][:categories] = @axis_labels
      f.options[:legend][:layout] = "horizontal"
      f.labels(:items=>[:html=>"#{@student_name}", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
    end
    render :student_profile
  end

end





