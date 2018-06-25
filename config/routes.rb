Rails.application.routes.draw do
  root "homes#index"

  scope "/sessions" do
    get "/new", to: "sessions#new", as: :login
    post "/", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
  end

  scope "/auth" do
    get "/:provider/callback", to: "sessions#social"
  end

  scope "/users" do
    get "/new", to: "users#new"
    post "/", to: "users#create"
  end

  scope "/dashboards" do
    get "/", to: "dashboards#index", as: :dashboard
  end
end
