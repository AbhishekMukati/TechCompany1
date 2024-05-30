class Category < ApplicationRecord
  # self.inheritance_column = :category_type
  has_and_belongs_to_many :products
end
