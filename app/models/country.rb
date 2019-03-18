class Country < ApplicationRecord 

  belongs_to :continent
  validates :name, presence: true, uniqueness: true
end
