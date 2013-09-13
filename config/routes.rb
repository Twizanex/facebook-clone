FacebookClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :photos, :only => [:index]
    resources :follows, :only => [:index, :create, :destroy]
    resources :messages
    resources :groups, :only => [:index, :new, :show, :create, :destroy]
    resources :posts, :only => [:index, :create, :destroy] do
      resources :tags, :only => [:create, :destroy]
      resources :likes, :only => [:create, :destroy]
      resources :comments, :only => [:create, :destroy] do
        resources :comment_likes, :only => [:create, :destroy]
      end
    end
  end
  resource :session, :only => [:create, :destroy, :new]

  root :to => "posts#index"
end

