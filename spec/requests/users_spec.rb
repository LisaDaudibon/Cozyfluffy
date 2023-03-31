require 'rails_helper'

RSpec.describe "/user", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      User.create! valid_attributes
      get admin_users_path
      expect(response).to be_successful
    end
  end
end