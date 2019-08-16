Rails.application.routes.draw do
  # mount_devise_token_auth_for 'University', at: 'auth'
  namespace :api do
    namespace :v0 do
      resources :articles, only: [:index]
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    end
  end
end
