Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_page#index'
  get '/about' => 'static_page#about'
  get 'webpage' => 'static_page#webpage'
  get '/blogs/tag/:tag' => 'blogs#tag'
  get '/users' => 'static_page#users'

  resources :blogs
  resources :informations
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
  }
end
