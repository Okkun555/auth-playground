Rails.application.routes.draw do
  # Basic認証
  get "basic_auth", to: "basic_auth#index"
  # Session認証
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # API Key
  get "external_protected", to: "external_protected#index"
end
