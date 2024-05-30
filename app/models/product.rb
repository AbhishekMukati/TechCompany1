class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
