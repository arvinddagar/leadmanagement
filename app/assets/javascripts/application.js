// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var x;
 function myFunctionModal(data_id) {
   $('#daily_update_id1').val($(data_id).attr('id'));
}
function myFunctionModal1(data_id) {
   $('#daily_update_id').val($(data_id).attr('id'));
   $.ajax('/fetch_meetings',{
      type: 'get',
        dataType: 'html',
        data: {meeting_id: $(data_id).attr('id')},
        success: function(data, textStatus, jqXHR)
          {
            
            x=d;
            var d=JSON.parse(data);
            $('#venue').val(d['venue']);
            $('#notes').val(d['notes']);
            $('#meeting_date').val(d['meeting_date']);
            $('#assigned_to').val(d['assigned_to']);
             $('#meeting_time').val(d['meeting_time']);
         
          }
    });
}

 function plan_submit(plan) {
 	
  $.ajax('/fetch_plans',{
      type: 'get',
        dataType: 'html',
        data: {plans: $(plan).val()},
        success: function(data, textStatus, jqXHR)
          {
            
            $('#renewal_date').val(data);
          }
    });
 }