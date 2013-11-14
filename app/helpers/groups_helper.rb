module GroupsHelper

 def group_pod_creation(groups, course_id)
    @new_group = Group.create(course_id: course_id.to_i)
    groups.map do |students|
      pod = Pod.create(group_id: @new_group.id)
      students.each do |student|
        StudentAssignment.find(student.id).update_attributes!(pod_id: pod.id)
      end
      pod
    end
  end
end
