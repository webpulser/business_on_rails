ActionController::Routing::Routes.draw do |map|

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.page '*url', :controller => 'url_catcher', :action => 'page'
end
