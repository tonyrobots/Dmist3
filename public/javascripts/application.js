$('#toggle_comment_form').click(function() {
	
	return false;
});

$(document).ready(function() {
  $('#comment_form').hide();
  $('#toggle_comment_form').click(function(event){
    $('#comment_form').toggle('slow');
	$('#toggle_comment_form').hide();
    event.preventDefault(); // Prevent link from following its href
  });
});


