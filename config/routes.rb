FacebookClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :follows
    resources :posts do
      resources :likes
      resources :comments do
        resources :comment_likes
      end
    end
  end
  resource :session, :only => [:create, :destroy, :new]

  resources :posts
  root :to => "posts#index"
end
