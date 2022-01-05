$(document).on('turbolinks:load', function() {
    
  $(document).ready(function() {
    $('#table_desing').DataTable();
  });

  $("#password").on('blur', function(){
    console.log('entro')
    let password = $('#password').val();
    let rgex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/
    let validate = rgex.test(password);
    if ( validate ) {
      $("#password").removeClass('border-red');
      $("#text-password").addClass('hide');
    } else {
      $("#password").addClass('border-red');
      $("#text-password").removeClass('hide');
      $('#password').val("");
    }
  })
  
  $("#confirmPassword").on('blur', function(){
    let password = $('#password').val();
    let confirmPassword = $('#confirmPassword').val();
    if ( password == confirmPassword ) {
      $("#confirmPassword").removeClass('border-red');
      $("#text-confirmPassword").addClass('hide');
    } else {
      $("#confirmPassword").addClass('border-red');
      $("#text-confirmPassword").removeClass('hide');
      $('#confirmPassword').val("");
    }
  })
  
  $("#email").on('blur', function(){
    let email = $('#email').val();
    let rgex = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
    var validate = rgex.test(email);
    if ( validate ) {
      $("#email").removeClass('border-red');
      $("#text-email").addClass('hide');
    } else {
      $("#email").addClass('border-red');
      $("#text-email").removeClass('hide');
      $('#email').val("");
    }
  })

})