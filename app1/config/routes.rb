Rails.application.routes.draw do
  # Basic認証
  get "basic_auth", to: "basic_auth#index"
end
