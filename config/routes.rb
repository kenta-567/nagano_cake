Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions'
}
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    patch "order_details/:id" => "order_details#update"
  end
  get "admin/homes", to: "admin/homes#top"
  
end
