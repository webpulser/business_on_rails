ActionController::Routing::Routes.draw do |map|
  map.resources :sites

  map.namespace :admin do |admin|
    admin.resources :sites, :member => { :activate => :post, :duplicate => :get}
    admin.resources "site_categories", :controller => 'categories', :requirements => { :type => "site_category" }
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.page '*url', :controller => 'url_catcher', :action => 'page'
end
