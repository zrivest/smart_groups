$(function() {
  $( "ul.droptrue" ).sortable({
    connectWith: "ul"
  });

  $( "#sortable1, #sortable2, #sortable3" ).disableSelection();
});
