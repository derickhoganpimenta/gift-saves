class CardsController < ApplicationController
  def index
    @cards = current_logged_user.get_cards
  end

  def new

  end

  def create
    respond_to do |format|
      begin
        current_logged_user.create_card(card_params)
        flash[:notice] = "Credit card successfully created"
        format.html { redirect_to cards_path }
      rescue Stripe::CardError => e
        flash[:error] = e.message
        format.html { render action: :new }
      rescue Exception => e
        flash[:error] = e.message
        format.html { render action: :new }
      end
    end
    @cards = current_logged_user.get_cards
  end

  def delete
    Card.delete(current_logged_user.customer_id, params[:id])
    @cards = current_logged_user.get_cards
  end

  private

  def card_params
    params.require(:card).permit(:card_holder_name, :card_number, :card_verification_code, :card_expiration)
  end
end
