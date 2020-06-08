Rails.application.routes.draw do
  root "demo#index"

  #all 8 CRUD actions 
  resources :subjects do
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
