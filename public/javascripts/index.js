var tags = new Array();

$(function(){
  
  $.get('/tags', function(data) {
    
    $.each(data, function(index, value) { 
      tags.push(value.name);
    });
    
    $("#tags").taggable({
  		availableTags: tags,
  		field_name: 'tags'
  	});
  
  });

});