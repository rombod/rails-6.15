Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products do
    resources :comments
  end

  #root 'products#index'
  
  #get 'static_pages/about'
  #get 'static_pages/contact'
  #get 'static_pages/index'
  #get 'static_pages/landing_page'
  #get 'payments/create'
  
  #post 'static_pages/thank_you'
  #post 'payments/create'
  #mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  
  get 'static_pages/thank_you'

post 'static_pages/thank_you'

  get 'about', to: 'static_pages#about'

  get 'contact', to: 'static_pages#contact'
  
  get 'landing_page', to: 'static_pages#landing_page'

  get 'index', to: 'static_pages#index'

  root :to => 'static_pages#about' 
 
 post 'payments/create'
  
   mount ActionCable.server => '/cable'
end