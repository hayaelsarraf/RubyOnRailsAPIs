Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, only: [:create]
      end

      resources :comments, only: [:update, :destroy]

      resources :tags, only: [:index, :create]
    end
  end
end
