Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :surveys, only: [:new, :create, :edit, :update]
    member do
      get 'invite'
    end
  end
end
