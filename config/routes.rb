Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users,
             controllers: { registrations: "devise/registrations", sessions: "devise/passwordless/sessions" }
  devise_scope :user do
    get "/users/magic_link",
        to: "devise/passwordless/magic_links#show",
        as: "users_magic_link"
  end

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
