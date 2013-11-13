module GroupsHelper

 def group_pod_creation(groups, course_id)
   @new_group = Group.create(course_id: course_id.to_i)
      groups.each do |pod|
        @pod = Pod.create(group_id: @new_group.id)
        pod.each do |student|
          StudentAssignment.find(student.id).update_attributes!(pod_id: @pod.id)
        end  
      end 
    end
end
