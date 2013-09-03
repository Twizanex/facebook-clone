FacebookClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :posts
  end
  resource :session, :only => [:create, :destroy, :new]

  resources :posts
  root :to => "posts#index"
end
