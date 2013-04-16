CleanersPanamby::Application.routes.draw do

  resources :addresses


  resources :states


  resources :countries


  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end


  scope "(:locale)", :locale => /en|pt|pt-BR/ do

    get "login/index"
    get "home/index"

    match 'home' => 'home#index'
    match 'login' => 'login#index'

    resources :items
    resources :customers
    resources :vehicles
  end

  # maps /pt-BR, /en...
  match '/:locale' => 'login#index'

  authenticated :user do
    root to: 'home#index'
  end

  root :to => 'login#index'
end
