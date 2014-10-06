$(function() {

$( "ul.droptrue" ).sortable({
  connectWith: "ul",
  update: function(event, ui) {
    var course_id = $('table').attr('class');
    var group_id = $('table').attr('id');
    var student_id = event.toElement.id.split("-")[1];
    var pod_id = event.target.id.split("-")[1];
    var data = {student_id: student_id, pod_id: pod_id};
    var url = '/courses/' + course_id + '/groups/' + group_id + '/update_through_ajax';

    $.post(url, data);
}
})
});

