FacebookClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :follows, :only => [:index, :create, :destroy]
    resources :posts, :only => [:index, :create, :destroy] do
      resources :likes, :only => [:create, :destroy]
      resources :comments, :only => [:create, :destroy] do
        resources :comment_likes, :only => [:create, :destroy]
      end
    end
  end
  resource :session, :only => [:create, :destroy, :new]

  resources :posts
  root :to => "posts#index"
end

