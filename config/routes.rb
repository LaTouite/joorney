Rails.application.routes.draw do
  get 'topics/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_events

  resources :events do
    resources :surveys, only: [:new, :create, :edit, :update]
    member do
      get 'invite'
    end
    member do
      get 'accomodation'
    end

    resources :user_events do
      member do
        post :send_invitation
      end
    end

    resources :suggestions, only: [:index]

  end

  resources :surveys, only: [:show] do
    resources :topics, only: [:create]
  end

  resources :choices, only: [:create]
end




