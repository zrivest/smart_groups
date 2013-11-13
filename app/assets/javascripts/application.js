// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
//= require highcharts
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require highcharts/highstock
//
//= require jquery.ui.all


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


