# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:category) { Category.create(name: "Test Category") }

    it "returns a success response" do
      get :show, params: { id: category.id }
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
    let(:category) { Category.create(name: "Test Category") }

    it "returns a success response" do
      get :edit, params: { id: category.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: { category: { name: "Test Category" } }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post :create, params: { category: { name: "Test Category" } }
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Category" do
        expect {
          post :create, params: { category: { name: "" } }
        }.to_not change(Category, :count)
      end
    end
  end

  describe "PATCH #update" do
    let(:category) { Category.create(name: "Test Category") }

    context "with valid params" do
      it "updates the requested category" do
        patch :update, params: { id: category.id, category: { name: "Updated Category" } }
        category.reload
        expect(category.name).to eq("Updated Category")
      end

      it "redirects to the category" do
        patch :update, params: { id: category.id, category: { name: "Updated Category" } }
        expect(response).to redirect_to(category)
      end
    end

    context "with invalid params" do
      it "does not update the category" do
        patch :update, params: { id: category.id, category: { name: "" } }
        category.reload
        expect(category.name).not_to eq("")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:category) { Category.create(name: "Test Category") }

    it "destroys the requested category" do
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_url)
    end
  end
end
