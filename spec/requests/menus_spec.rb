require 'rails_helper'

RSpec.describe "/menus", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Product.create! valid_attributes
      Category.create! valid_attributes
      get menu_index_path
      expect(response).to be_successful
    end
  end
end