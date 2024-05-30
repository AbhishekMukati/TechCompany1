# spec/controllers/products_controller_spec.rb
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:product) { Product.create(name: "Test Product", description: "Test Description", price: 10.99) }

    it "returns a success response" do
      get :show, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:product) { Product.create(name: "Test Product", description: "Test Description", price: 10.99) }

    it "returns a success response" do
      get :edit, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: { name: "Test Product", description: "Test Description", price: 10.99 } }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created
