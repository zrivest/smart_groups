module MetricsHelper

  def get_average(array)
    array.inject{ |sum, element| sum + element }.to_f / array.length
  end

  def selected_chart_type?(selections,at_index)
    type1 = "Each Student's Assignment Scores by Assignment"
    type2 = "Individual Student Performance by Assignment Due Date"
    type3 = "Class Average Assignment Scores by Due Date"

    types = [type1, type2, type3]

     if selections.include?(types[at_index])
      true
    else
      false
    end
  end

end
