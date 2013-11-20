class GraphGenerator
  extend ActiveModel::Callbacks
  include ActiveModel::Validations

  define_model_callbacks :generate

  attr_accessor :graph, :course_id, :array_of_series_hashes, :course

  def initialize(*series_hash, course_id)
    self.array_of_series_hashes = [*series_hash]
    @course = Course.find(course_id)
  end

  def generate!
    run_callbacks :generate do
      self.graph = Graph.create(course_id: course_id)
      self.array_of_series_hashes.each do |hash|
        hash.each do |key,value|
          self.graph.plots << Plot.create(plot_name: key, data: value)
        end
      end
    end
  end

  def column_graph(labels, class_averages = [])
    axis_labels = labels.uniq!
    class_averages = class_averages.uniq!

    column_graph = self.graph
    chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=> @course.name })
      column_graph.plots.each do |plot|
        f.series(:type=> "column",:name=> "#{plot.plot_name}", :data=> plot.data)
      end
      f.series(:type=> "spline",:name=> "#{@course.name} Mean", :data=> class_averages)
      f.options[:xAxis][:categories] = axis_labels
      f.options[:legend][:layout] = "horizontal"
      f.labels(:items=>[:html=>"Student Test Grades", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
    end
  end
end
