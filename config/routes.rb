Rails.application.routes.draw do
  resources :notifications, only: %w[index show create]
  resources :announcements
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users,
    controllers: {
      registrations: "devise/registrations",
      sessions: "devise/passwordless/sessions",
      confirmations: "devise/passwordless/confirmations"
    }
  devise_scope :user do
    get "/users/magic_link",
      to: "devise/passwordless/magic_links#show",
      as: "users_magic_link"
  end

  namespace :admin do
    get 'utilities/notification'
    resource :settings
  end


  authenticated :user do
    # root "high_voltage/pages#show", id: "dashboard",
    root "high_voltage/pages#show", id: "dashboard", as: :authenticated_root
  end

  devise_scope :user do
    root "high_voltage/pages#show", id: "marketing"
  end
end
