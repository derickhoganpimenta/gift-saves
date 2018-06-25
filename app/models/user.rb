class User < ApplicationRecord

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

  def capitalize_first_and_last_names
    begin
      self.first_name = self.first_name.strip.capitalize
      self.last_name = self.last_name.strip.capitalize
    rescue
    end
  end
end
