Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  # devise_for :admins
  # devise_for :customers
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :event_templates, only: [:index, :new, :create, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :events, only: [:index, :show]
  end

  root to: 'homes#top'

  resources :customers, only: [:show, :edit, :update] do
    resources :my_menus, only: [:index, :new, :create]
    resources :my_menu_items, only: [:destroy]
    resources :my_supplements, only: [:index, :new, :show, :create, :update, :destroy]
    resources :my_gyms, only: [:index, :new, :create, :destroy]
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
    get 'groups' => 'groups#customer_index'
    resources :event_likes, only: [:index, :show]
    resources :datas, only: [:index]
  end

  put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
  resources :events, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :event_likes, only: [:create, :destroy]
  end

  resources :event_templates, only: [:index, :show]
end
