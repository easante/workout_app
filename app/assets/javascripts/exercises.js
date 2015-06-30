// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#chart').data('workouts'),
    // The name of the data record attribute that contains x-values.
    xkey: 'workout_date',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['duration_in_min'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Duration (min)'],
    xLabels: "day",
    xLabelAngle: 60,
    xLabelFormat: function (x) {
      date_string = x.getFullYear() + "/" + x.getMonth() + "/" + x.getDate();
      return date_string;
    },
    yLabelFormat: function(y) { return y + ' min'; }
  });
});
