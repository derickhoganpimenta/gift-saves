class Coundy < ApplicationRecord
  has_many :coundy_cities
  has_many :cities, through: :coundy_cities

  validates :name, presence: true, uniqueness: true
end
