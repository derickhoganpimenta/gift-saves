class DashboardsController < ApplicationController

  def donors_profile
    @address = current_logged_user.address || current_logged_user.build_address
    @cities = City.order("name asc")
  end

  def donors_wishlist
    @wishlists = current_logged_user.wishlists
  end

  def donors_my_non_profits
    @non_profits = current_logged_user.subscriptions
  end

  def donors_my_donations
    @donations = current_logged_user.subscriptions.includes(:transactions)
  end
end
