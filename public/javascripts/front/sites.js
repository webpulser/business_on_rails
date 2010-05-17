pictures = null
pic = null
function display_site(site_data){
  image_list = $('<ul></ul>')
  for(j=0; j<site_data['pictures'].length; j++){
    //alert(j);
    image_list.append('<li class="carrousel"><img src="'+site_data['pictures'][j]+'"/>');
  }
  li = '<li><div class="grid_6"><div class="border"> <div class="carrousel"> <ul>'+image_list.html()+'</ul> </div> <div class="nav"> <div class="left"> <a href="#"> previous </a> </div> <div class="center"></div> <div class="right"> <a href="#"> next </a> </div> <div class="clear"></div> </div> <div class="description padding"> <div class="left"> <a href="'+site_data['url']+'">' +site_data['title']+'</a> <a class="category" href="?category_id=34"> toto </a> </div> <div class="right"> </div> </div> </div>'
  $('ul#site-list').append(li);
}

function display_sites(json){
  for(i=$('#site-list').children('li').length; i<json['iTotalDisplayRecords']; i++){
    //alert(i);
    display_site(json['aaData'][i]);
  }
}

jQuery(document).ready(function(){
  $('ul.pages').hide();
  json_uri = 'sites.json'
  if(document.baseURI.split('?').length > 1)
    json_uri += '?' + document.baseURI.split('?')[1]
  $.getJSON(json_uri, null, function(json){
    display_sites(json);
  });
});
