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
    resources :achievements
    resources :testimonials
    resources :blog_posts do
      member do
        get :preview
      end
    end
    resources :comments do
      collection do
        delete :destroy_multiple
      end
      member do
        put :approve
        put :reject
      end
    end
    resources :images
  end

  match '' => 'home#index'
  match '/about' => 'about#index'
  match '/admin' => 'admin_layout#index'
  match '/login' => 'user_sessions#new'
  match '/logout' => 'user_sessions#destroy'
  match '/contact' => 'contacts#new'
  match ':controller/service.wsdl' => '#wsdl'
  match '/:controller(/:action(/:id))'
end
