NewFoss::Application.routes.draw do
  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :meetings do
    resources :participants
    resource :outcome
    resource :location
  end

  resources :events do
    resources :econtacts
    resources :eventlists
    resource :elocation
    resource :result
  end

  resources :users do
    member do
      get :alter_role
      put :alter_role
      get :def_mod
      put :def_mod
    end
  end

  resources :categories, :except => [:index, :show]
  resources :forums, :except => :index do
    resources :topics, :shallow => true, :except => :index do
      resources :posts, :shallow => true, :except => [:index, :show]
    end
  end
  
  
  resources :participants
  root to: 'static_pages#home'
  match '/about',   to: 'static_pages#about'
  match '/forums' , to: 'categories#index'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :sessions
end
