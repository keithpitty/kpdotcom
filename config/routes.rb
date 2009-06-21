ActionController::Routing::Routes.draw do |map|
  
  map.resources :contacts, :controller => :contact
  map.namespace :blog do |blog|
    blog.resources :archives
    blog.resources :tags, :controller => :tagged
  end
  map.resources :feed
  map.resources :blog_posts, :controller => "blog/archives", :member => { :create_comment => :post }
  map.resources :comments
  map.resources :services
  
  map.namespace :admin do |admin|
    admin.resources :services
    admin.resources :achievements
    admin.resources :testimonials
    admin.resources :blog_posts
    admin.resources :comments, :collection => { :destroy_multiple => :delete }, 
                               :member => { :approve => :put, :reject => :put }
  end

  map.connect '', :controller => "home"
  
  # Admin layout
  map.connect '/admin', :controller => "admin_layout", :action => "index"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
