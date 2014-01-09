FacebookScraper::Application.routes.draw do
  root 'home#index'
  mount Resque::Server, :at => "/resque"
  
  resources :users, :only => [:index] do 
    collection do
      get 'facebook_profile'
      get 'facebook_friends'
      get 'facebook_groups'
      get 'profile'
      get 'my_albums'
    end
  end
  match '/users/facebook_group_member(/:group_id)', to: 'users#facebook_group_member', via: [:get], :as => "facebook_group_member_users"
  match '/users/profile(/:fbid)', to: 'users#profile', via: [:get], :as => "my_facebook_profile"
  match '/users/my-album-photos(/:album_id)', to: 'users#my_album_photos', via: [:get], :as => "my_album_photos"

  match '/dashboard', to: 'home#dashboard', via: [:get]
  match 'auth/:provider/callback', to: 'sessions#create' , via: [:get, :post]
  
  resources :facebooks, :only => [:index] do
    collection do 
      get 'wall_post'
      post 'send_wall_post'
      get 'link_post'
      post 'send_link_post'

    end

  end
  
  match 'auth/failure', to: redirect('/'), via: :get
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :delete]

end
