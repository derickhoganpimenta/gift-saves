class DonorsDashboardsController < ApplicationController
  def index
    @addresses = current_logged_user.addresses
    @user = current_logged_user
  end
end
