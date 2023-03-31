require 'rails_helper'

RSpec.describe "/products", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_product_path
      expect(response).to be_truthy
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get edit_product(path)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a Product" do
        expect {
          post products_path, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created category" do
        post products_path, params: { product: valid_attributes }
        expect(response).to redirect_to(menu_index_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Product" do
        expect {
          post products_path, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post products_path, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        patch product_path(product), params: { product: new_attributes }
        product.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the menu" do
        product = Product.create! valid_attributes
        patch product_path(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(menu_index_path)
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        patch product_path(product), params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      product = Product.create! valid_attributes
      expect {
        delete product_path(product)
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the categories list" do
      product = Product.create! valid_attributes
      delete product_path(product)
      expect(response).to redirect_to(menu_index_url)
    end
  end
end
