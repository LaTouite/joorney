Rails.application.routes.draw do
  get 'topics/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # USER_EVENTS
  resources :user_events do
    member do
      get 'confirm_invitation'
    end
  end

  # EVENTS
  resources :events do
    # SURVEYS via EVENTS
    resources :surveys, only: [:new, :create, :edit, :update]
    member do
      get 'invite'
    end
    member do
      get 'accomodation'
    end

    # USER_EVENTS via EVENTS
    resources :user_events do
      member do
        post :send_invitation
      end
    end
    resources :suggestions, only: [:index]
  end

  # SURVEY
  resources :surveys, only: [:show] do
    resources :suggestions, only: [:create, :destroy]
  end

  # CHOICES
  resources :choices, only: [:create]
end




