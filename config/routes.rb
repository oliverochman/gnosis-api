Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :articles, only: [:index, :create]
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
        registrations: :registrations
      }
    end
  end
end
