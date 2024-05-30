# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should have_and_belong_to_many(:products) }
  end
end

