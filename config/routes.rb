Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/gs_dash', as: 'rails_admin'
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
    get "/donors", to: "dashboards#donors", as: :donors_dashboard
    get "/non-profits", to: "dashboards#non_profits", as: :non_profits_dashboard
    get "/business", to: "dashboards#business", as: :business_dashboard
  end
end
