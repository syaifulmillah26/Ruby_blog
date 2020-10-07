Rails.application.routes.draw do
    
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

  
    resources :articles do
        resources :comments
    end

    resources :about
    root 'home#index'
end
