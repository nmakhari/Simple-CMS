Rails.application.routes.draw do

  root "demo#index"

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'


  #all 8 CRUD actions 
  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do 
    member do 
      get :delete
    end
  end

  resources :sections do 
    member do 
      get :delete
    end
  end

  #get "test_controller/test_view"

  match "/test", :to => "test_controller#test_view", :via => :get

  get 'demo/index'

  #match route
  get "demo/hello"

  #for redirect
  get 'demo/other_hello'

  # default route
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
