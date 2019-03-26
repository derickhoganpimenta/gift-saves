class Card
  def self.card_format(card)
    "xxxx xxxx xxxx #{card.last4} | #{card.exp_month}/#{card.exp_year}"
  end

  def self.delete(customer_id, card_id)
    Stripe::Customer.delete_source(
      customer_id,
      card_id
    )
  end
end
