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
    scope "/donors" do
      get "/", to: "donors_dashboards#index", as: :donors_dashboard
      get "/profile", to: "donors_dashboards#index", as: :donors_profile_dashboard
      get "/wishlist", to: "dashboards#donors_wishlist"
      get "/my-non-profits", to: "dashboards#donors_my_non_profits"
      get "/my-donations", to: "dashboards#donors_my_donations"
    end
    scope "/non-profits" do
      get "/", to: "non_profits_dashboards#index", as: :non_profits_dashboard
    end
    scope "/profile" do
      post "/avatar/update", to: "users#update_avatar", as: :avatar_update
    end
    scope "/addresses" do
      get "/", to: "addresses#index"
      get "/new", to: "addresses#new", as: :addresses_new
      post "/", to: "addresses#create", as: :addresses_create
      get "/:id", to: "addresses#show"
      get "/:id/edit", to: "addresses#edit", as: :addresses_edit
      put "/:id", to: "addresses#update", as: :addresses_update
      delete ":id", to: "addresses#delete"
    end
    scope "/cards" do
      get "/", to: "cards#index", as: :cards
      get "/new", to: "cards#new", as: :cards_new
      post "/", to: "cards#create", as: :cards_create
      delete "/:id", to: "cards#delete", as: :cards_delete
    end
    scope "/wishlists" do
      get "/", to: "wishlists#index", as: :wishlists
      get "/create", to: "wishlists#create", as: :wishlists_create
      delete "/:id", to: "wishlists#delete"
    end    
    get "/business", to: "dashboards#business", as: :business_dashboard
  end
end
