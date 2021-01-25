Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions'
}
  devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "public/homes#top"
  get "about" => "public/homes#about"
  get "customers/my_page" => "public/customers#show"
  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdrawal" => "public/customers#withdrawal"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
  get "orders/thanks" => "public/orders#thanks"
  post "orders/confilm" => "public/orders#confilm"
  post "orders" => "public/orders#create"

  resources :addresses, except: [:new, :show]
  resources :orders, only:[:new, :index, :show]
  resources :items, only:[:show, :index]
  resources :customers, only:[:edit, :update]
  resources :cart_items, only:[:index, :create, :update, :destroy]
    
    
  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    patch "order_details/:id" => "order_details#update"
  end
  get "admin/homes", to: "admin/homes#top"
  
end
