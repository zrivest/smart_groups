$(function() {

// DRAG/DROP
$( "ul.droptrue" ).sortable({
  connectWith: "ul",
  update: function(event, ui) {
  console.log(event);
    var course_id = $('table').attr('class');
  console.log(course_id)
    var group_id = $('table').attr('id');
  console.log(group_id)
    var student_id = event.toElement.id.split("-")[1];
    // console.log(student_id);
    var pod_id = event.target.id.split("-")[1];
    // console.log(pod_id);
    var data = {student_id: student_id, pod_id: pod_id};
    var url = "/courses/' + $course_Id + '/groups/' + $group_Id+ '/update_through_ajax";

    $.post(url, data);


}

  // ajax call to server
  // with group_id, student_ids
})
});

