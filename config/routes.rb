Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboard#show'
  end

  # -----------------------------------
  root to: 'home#show'
  # -----------------------------------

  # -----------------------------------
  resource :search, only:[:show]

  # resource, not resources in order to have 
  # a single path
  # -----------------------------------


  # -----------------------------------
  post "text_shouts" => 'shouts#create', defaults: { content_type: TextShout}
  # creates a text shout - cant be changed through form from default
  post "photo_shouts" => 'shouts#create', defaults: { content_type: PhotoShout}

  resources :shouts, only: [:create, :show] do
    member do
      post "like" => 'likes#create'
      delete "unlike" => 'likes#destroy'
    end
  end
  # -----------------------------------


  # -----------------------------------
  resources :hashtags, only: :show
  # resources for hashtags
  # -----------------------------------

  # -----------------------------------
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]
  # -----------------------------------

  # -----------------------------------
  resources :users, only: [:create, :show] do
    resources :followers, only: [:index]
    # new addition to user member - follow button group
    member do 
      post "follow" => 'followed_users#create'
      delete "unfollow" => 'followed_users#destroy'
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  # -----------------------------------

  # -----------------------------------
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # -----------------------------------
end
