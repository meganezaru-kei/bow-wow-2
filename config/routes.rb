Rails.application.routes.draw do
  mount_roboto
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'search', to: 'posts#search'
  resources :posts do
    collection do
      get  'set_category_children',      defaults: { format: 'json' }
    end
  end
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[show edit update]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  } 
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end
