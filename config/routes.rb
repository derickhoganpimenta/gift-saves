Rails.application.routes.draw do
  root "homes#index"

  scope "/sessions" do
    get "/new", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
  end

  scope "/users" do
    get "/new", to: "users#new"
  end
end
