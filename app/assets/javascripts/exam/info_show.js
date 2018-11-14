$(document).ready(function(){
  $('#update_info_base_exam').click(function(){
    var exam_id = $(this).val();
    var exam_name = $('#exam_name').val();
    var exam_code = $('#exam_code').val();
    var subject_id = $('#subject_id').val();
    var period_for = parseInt($('#period_for').val());
    var supervistor = $('#supervistor').val();
    var extra_info = $('#extra_info').val();
    $.ajax({
      url: '/exam/update_exam',
      type: 'POST',
      data: {
        exam_id: exam_id,
        exam_name: exam_name,
        exam_code: exam_code,
        subject_id: subject_id,
        period_for: period_for,
        supervistor: supervistor,
        extra_info: extra_info
      },
      success: function(response){
        new PNotify({
                        title: 'Success!',
                        text: response['message'],
                        type: response['noti']
                    });
      },
      error: function(response){
        new PNotify({
                        title: 'Oh No!',
                        text: response['message'],
                        type: response['noti']
                    });
      }
    });
  });

  $('#create_thread_random').click(function(){
    var exam_id = $(this).val();
    $.ajax({
      url: '/exam_thread/create_exam_thread',
      type: 'POST',
      data: {exam_id: exam_id},
      success: function(response){
        new PNotify({
          title: 'Success!',
          text: response['message'],
          type: response['noti']
        });
      },
      error: function(response){
        new PNotify({
          title: 'Oh No!',
          text: response['message'],
          type: response['noti']
        });
      }
    });
  });


  $('#permit_enter').on('switchChange.bootstrapSwitch', function (e, data) {
      if(this.checked){
      var exam_id = $('#permit_enter').val();
          $.ajax({
            url: '/exam/student_on_flag',
            type: 'POST',
            data: {exam_id: exam_id},
            success: function(response){
              new PNotify({
                        title: 'Success!',
                        text: response['message'],
                        type: response['noti']
                    });
            },
            error: function(response){
              new PNotify({
                        title: 'Oh No!',
                        text: response['message'],
                        type: response['noti']
                    });
            }
          });
        }
        else{
          var exam_id = $('#permit_enter').val();
          $.ajax({
            url: '/exam/student_off_flag',
            type: 'POST',
            data: {exam_id: exam_id},
            success: function(response){
              new PNotify({
                        title: 'Success!',
                        text: response['message'],
                        type: response['noti']
                    });
            },
            error: function(response){
              new PNotify({
                        title: 'Oh No!',
                        text: response['message'],
                        type: response['noti']
                    });
            }
          });
        }
  });

  $('#launch_exam').on('switchChange.bootstrapSwitch', function (e, data) {
      if(this.checked){
      var exam_id = $('#launch_exam').val();

          $.ajax({
            url: '/exam/update_happening_status',
            type: 'POST',
            data: {exam_id: exam_id},
            success: function(response){
              new PNotify({
                        title: 'Success!',
                        text: response['message'],
                        type: response['noti']
                    });
            },
            error: function(response){
              new PNotify({
                        title: 'Oh No!',
                        text: response['message'],
                        type: response['noti']
                    });
            }
          });
        }
  });
});
