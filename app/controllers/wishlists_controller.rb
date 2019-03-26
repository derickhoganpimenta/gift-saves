class WishlistsController < ApplicationController

  def index
    @wishlists = current_logged_user.wishlists.includes(:non_profit)
  end

  def create

  end

  def delete

  end

  private

  def wishlists_params
    params.require(:wishlist).permit(:non_profit_id)
  end
end
