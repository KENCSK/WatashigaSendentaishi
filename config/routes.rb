Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'homes#top'

  get 'posts/search', to: 'posts#search'


  get '/my_page' => 'users#my_page'
  resources :users, except: [:new]

  resources :posts do
    resource :charms, only:[:create, :destroy]
    collection do
      get "search"
    end
  end


end
