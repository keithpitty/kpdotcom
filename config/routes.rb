Rails.application.routes.draw do
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
    resources :blog_posts, except: :show do
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

  get '', to: 'home#index'
  get '/about', to: 'about#index'
  get '/admin', to: 'admin_layout#index'
  get '/login', to: 'user_sessions#new'
  get '/logout', to: 'user_sessions#destroy'
  get '/blog', to: 'blog#index'
  get '/testimonials', to: 'testimonials#index'
  get '/contact', to: 'contacts#new'
end
