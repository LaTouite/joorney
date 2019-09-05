Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end

  get 'topics/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

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
    member do
      get 'payment'
    end

    # USER_EVENTS via EVENTS
    resources :user_events do
      member do
        post :send_invitation
      end
    end
    # SUGGESTIONS via EVENTS
    resources :suggestions, only: [:index]

    # ACTIVITIES via EVENTS
    resources :activities, only: [:index, :show] do
      resources :event_activities, only: [:create, :destroy]
    end
  end

  # resources :event_activities, only: [:destroy]

  # SURVEY
  resources :surveys, only: [:show, :edit, :update] do
    resources :suggestions, only: [:create, :destroy]
  end

  # CHOICES
  resources :choices, only: [:create]
end




