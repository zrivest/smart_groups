class MetricsController < ApplicationController

  def main
    @course = Course.find(params[:course_id])
    session[:course_id] = @course.id
    @chart_types = [{id: 1, type: "column"}, {id: 2, type: "combo"}, {id: 3, type: "basic line"}]

  end

  def create
    @selections = params["chart_selections"]
    @course = Course.find(session[:course_id])
    @completed_assignments = @course.all_completed_assignments_for_course
    @categories = Array.new
    @student_names = Array.new
    @hash = {}
    @completed_assignments.each do |student_assignment|
      @categories << "#{student_assignment.assignment.assignment_name}"
          #assignment name
          @student_names << student_assignment.student.first_name
          #assignment grade
          @student_grades = student_assignment.student.get_grades
          @hash[student_assignment.student.name] = @student_grades
        end


        p "---------------------------------------"
        @hash.each do |k,v|
          p "THIS IS THE KEY: #{k}"
          p "THIS IS THE VAL: #{v}"
        end
        p @categories
        p "---------------------------------------"


        # type: "column", name: student name, data: all their grades
       # (:type=> "column",:name=> student_assignment.assignment.assignment_name,:data=> grades)


       @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>@course.name})
        @hash.each do |k,v|
          f.series(:type=> "column",:name=> "#{k}", :data=> v)
        end


        f.options[:xAxis][:categories] = @categories
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
      end

      render :show
    end


  end


