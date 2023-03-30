require 'rails_helper'

RSpec.describe "/cats", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_cat_path
      expect(response).to be_truthy
    end
  end

  
end