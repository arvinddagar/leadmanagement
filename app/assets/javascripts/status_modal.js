 $(document).ready(function(){
   $(".announce").click(function(){

     $('#s_id').val($(this).attr('id'));
      $.ajax('/fetch_daily',{
      type: 'get',
        dataType: 'html',
        data: {daily_up: $(this).attr('id')},
        success: function(data, textStatus, jqXHR)
          {
           $('#daily_update_id').val(data);
          }
    });

   });
});