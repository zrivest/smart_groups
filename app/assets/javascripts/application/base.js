$(function() {
  $( "ul.droptrue" ).sortable({
    connectWith: "ul",
    update: function(event, ui) {
      console.log(event);

      var student_id = event.toElement.id.split("-")[1];
      console.log(student_id);
      var group_id = event.target.id.split("-")[1];
      console.log(group_id);
    }
  });
  $( "#sortable1, #sortable2, #sortable3" ).disableSelection();

  //DATEPICKER
  $( "#datepicker" ).datepicker();
  $( "#datepicker2" ).datepicker();
  //  (above) - if testing successful, delete above
// $("#datepicker").removeClass('hasDatepicker').datepicker({
//     onSelect: function() {
//         var dateObject = $(this).datepicker('getDate');
//         $('#inp_datepicker')[0].value = convertDateToString(dateObject);
//     }
// });

// $("#datepicker2").removeClass('hasDatepicker').datepicker({
//     onSelect: function() {
//         var dateObject = $(this).datepicker('getDate');
//         $('#inp_datepicker2')[0].value = convertDateToString(dateObject);
//     }
// });
});


$(document).ready(function(){
  $('button').on('click', function(event){
    var whatever = $('ul #sortable').attr("class");
    console.log(whatever)
    $('ul .droptrue').children().addClass("THIS WORKS")






  })
})