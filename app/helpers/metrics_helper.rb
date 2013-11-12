module MetricsHelper

  def get_average(array)
    array.inject{ |sum, element| sum + element }.to_f / array.length
  end

end
