$(function() {

$( "ul.droptrue" ).sortable({
  connectWith: "ul",
  receive: function(event, ui) {
    var $el = $(event.toElement);
    var $ul = $el.closest("ul");

    var data = {student_id: $el.data("student-id"), pod_id: $ul.data("pod-id")};
    var url = $ul.data("update-url");

    $.post(url, data);
}
})
});

