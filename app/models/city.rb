class City < ApplicationRecord
  has_many :coundy_cities
  has_many :coundies, through: :coundy_cities
  has_many :addresses

  validates :name, presence: true, uniqueness: true
end
