class User < ApplicationRecord

  has_many :addresses, as: :addressable
  has_many :own_non_profits, class_name: "NonProfit", foreign_key: "owner_id"
  has_many :wishlists

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, presence: true, uniqueness: true
  validates :password, length: 8..20, allow_blank: true
  validates_confirmation_of :password

  has_attached_file :avatar, {
    styles: {
      minimum: '32x32#',
      avatar: '80x80#',
      thumb: '100x100>',
      medium: '300x300>',
      big: '1024x768>'
    },
    :s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }
  }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_secure_password
  has_secure_token

  before_save :capitalize_first_and_last_names

  def full_name
    first_name + " " + last_name
  end

  def capitalize_first_and_last_names
    begin
      self.first_name = self.first_name.strip.capitalize
      self.last_name = self.last_name.strip.capitalize
    rescue
    end
  end

  def get_cards
    if not customer_id
      assign_customer_id
    end
    Stripe::Customer.retrieve(customer_id).sources.all(:object => "card")
  end

  def assign_customer_id
    if not customer_id
      customer_search = User.search_stripe_customer(email, 1)
      if customer_search.count > 0
        customer = customer_search.first
      else
        customer = Stripe::Customer.create(
          email: self.email,
          metadata: {"name" => self.full_name}
        )
      end
      self.update_attribute("customer_id", customer.id)
    end
    self.customer_id
  end

  def self.generate_customer_id(email, full_name)
    customer_search = User.search_stripe_customer(email, 1)
      if customer_search.count > 0
        customer = customer_search.first
      else
        customer = Stripe::Customer.create(
          email: email,
          metadata: {"name" => full_name}
        )
      end
    customer.id
  end

  def self.search_stripe_customer(email, limit)
    Stripe::Customer.list(email: email, limit: limit)
  end

  def create_card(params)
    customer = Stripe::Customer.retrieve(customer_id)
    customer.sources.create(source: generate_token(params)).id
  end

  def generate_token(params)
    Stripe::Token.create(
      card: {
        number: params[:card_number],
        exp_month: params[:card_expiration].split("/")[0],
        exp_year: params[:card_expiration].split("/")[1],
        cvc: params[:card_verification_code],
        name: params[:card_holder_name]
      }
    ).id
  end
end
