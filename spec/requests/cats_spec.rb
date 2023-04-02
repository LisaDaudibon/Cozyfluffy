require 'rails_helper'

RSpec.describe "/cats", type: :request do
  before do
    @cat = FactoryBot.create(:cat)
  end

  describe 'GET / Index' do
    it 'returns success' do
      get cats_path

      expect(response).to have_http_status 200
    end
  end

  describe 'GET / Show' do
    it 'returns success' do
      get cat_path(@cat.id)

      expect(response).to have_http_status 200
    end
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /edit" do
    it "renders a successful response" do
      cat = Cat.create! valid_attributes
      get edit_cat_path(cat)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cat" do
        expect {
          post cats_path, params: { cat: valid_attributes }
        }.to change(Cat, :count).by(1)
      end

      it "redirects to the created cat" do
        post cats_path, params: { category: valid_attributes }
        expect(response).to redirect_to(cat_path(cat))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cat" do
        expect {
          post cats_path, params: { cat: invalid_attributes }
        }.to change(Cat, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cats_path, params: { cat: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested category" do
        cat = Cat.create! valid_attributes
        patch cat_path(cat), params: { cat: new_attributes }
        cat.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the category" do
        cat = Cat.create! valid_attributes
        patch cat_path(category), params: { cat: new_attributes }
        cat.reload
        expect(response).to redirect_to(cat_url(cat))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        cat = Cat.create! valid_attributes
        patch cat_url(cat), params: { cat: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      cat = Cat.create! valid_attributes
      expect {
        delete cat_url(cat)
      }.to change(Cat, :count).by(-1)
    end

    it "redirects to the categories list" do
      cat = Cat.create! valid_attributes
      delete cat_path(cat)
      expect(response).to redirect_to(cats_path)
    end
  end
end