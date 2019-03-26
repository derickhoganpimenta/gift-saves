class NonProfit < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :wishlist
  has_one :address, as: :addressable

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
end
