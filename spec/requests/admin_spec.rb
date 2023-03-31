require 'rails_helper'

RSpec.describe "/admin", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      User.create! valid_attributes
      get admin_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_path
      expect(response).to be_truthy
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get edit_admin(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin" do
        expect {
          post admin_index_path, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created admin" do
        post admin_index_path, params: { user: valid_attributes }
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin" do
        expect {
          post admin_index_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_index_path, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin" do
        admin = User.create! valid_attributes
        patch admin_path(user), params: { user: new_attributes }
        admin.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin" do
        user = User.create! valid_attributes
        patch admin_path(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        patch admin_path(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin" do
      admin = User.create! valid_attributes
      expect {
        delete admin_path(admin)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the events list" do
      user = User.create! valid_attributes
      delete admin_path(user)
      expect(response).to redirect_to(admin_users_path)
    end
  end
end