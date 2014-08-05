class Manufacturer < ActiveRecord::Base
  has_many :car_listings, dependent: :nullify
  validates :name, presence: true
  validates :country, presence: true
end

