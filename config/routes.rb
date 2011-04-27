Kpdotcom::Application.routes.draw do
  resource :user_session
  resources :contacts
  namespace :blog do
    resources :archives do
      member do
        post :create_comment
      end
    end
    resources :tags
  end

  resources :feed
  resources :blog_posts

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
  match '/login' => 'user_sessions#new'
  match '/logout' => 'user_sessions#destroy'
  match '/contact' => 'contacts#new'
  match ':controller/service.wsdl' => '#wsdl'
  match '/:controller(/:action(/:id))'
end
