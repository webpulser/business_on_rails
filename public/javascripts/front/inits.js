jQuery(document).ready(function(){
  $.get('/users/logins.html', function(data) {
    $('#top-menu').append(data);
  });
});
