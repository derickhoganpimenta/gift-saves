class NonProfit < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :owner, class_name: "User"
  has_many :wishlist
  has_one :address, as: :addressable
  has_many :non_profit_categories
  has_many :categories, through: :non_profit_categories

  has_attached_file :badge, {
    styles: {
      minimum: '32x32#',
      avatar: '80x80#',
      thumb: '100x100>',
      medium: '300x300>',
      big: '1024x768>'
    },
    :s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }
  }.merge(PAPERCLIP_STORAGE_OPTIONS)

  validates_attachment_content_type :badge, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

  def social_networks?
    return true if !(facebook.empty? and twitter.empty? and instagram.empty? and google_plus.empty? and contact_email.empty?)
    return false
  end
end
