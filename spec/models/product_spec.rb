# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { should have_and_belong_to_many(:categories) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(10) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end
end
