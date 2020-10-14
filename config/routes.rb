Rails.application.routes.draw do
    
  resources :forums
  resources :category_products
  resources :products
  resources :shops, only:[:index, :show]
  resources :order_items
  

  resource :carts, only:[:show]

  # resources :posts
  get '/posts', to: 'posts#index' 
  get '/posts/new', to: 'posts#new' 
  get '/posts/:id', to: 'posts#show'
  post '/posts', to: 'posts#create'
  get '/posts/:id/edit', to: 'posts#edit'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#delete'
  
  
  # devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_for :users,
  :path => "",
  :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :password => 'secret',
    :confirmation => 'verification',
    :unlock => 'unblock',
    :registration => 'register',
    :sign_up => 'cmon_let_me_in' }



    # article category
    resources :categories
  
    resources :articles do
        resources :comments
    end

    # shops
    resources :shop_cats 
    resources :shops 

    resources :about
    root 'home#index'

    # api 
    namespace :api, defaults: {format: :json} do
      namespace :v1  do 
        resources :articles
        resources :categories
        resources :category_products
        resources :products 
        resource :carts, only:[:show]
        resources :order_items
      end
    end

end
