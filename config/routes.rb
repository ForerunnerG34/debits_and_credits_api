Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create destroy]
      resources :tokens, only: [:create]
      resources :journals, only: %i[show index]
      resources :accounts, only: %i[show index create update]
    end
  end
end
