Kpdotcom::Application.routes.draw do
  resources :contacts
  namespace :blog do
    resources :archives
    resources :tags
  end

  resources :feed
  resources :blog_posts do
    member do
      post :create_comment
    end
  end

  resources :comments
  resources :services
  namespace :admin do
    resources :services
    resources :achievements
    resources :testimonials
    resources :blog_posts
    resources :comments do
      collection do
        delete :destroy_multiple
      end
      member do
        put :approve
        put :reject
      end
    end
  end

  match '' => 'home#index'
  match '/admin' => 'admin_layout#index'
  match ':controller/service.wsdl' => '#wsdl'
  match '/:controller(/:action(/:id))'
end
