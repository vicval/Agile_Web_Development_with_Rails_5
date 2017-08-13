Rails.application.routes.draw do
  #get 'admin/index'
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  resources :users do
    member do
      get 'validate' => :validate
      post 'validate' => :edit
    end
  end

  resources :orders
  resources :line_items do
  	member do
  		post 'decrement'
  	end
  end

  resources :carts
  root 'store#index', as: 'store_index'
  #get 'store/index'

  resources :products do
    get :who_bought , on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
