require 'rails_helper'

RSpec.describe "/checkouts", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "POST /brunch" do
    context "with valid parameters" do
      it "redirects to the order validation" do
        post checkout_brunch_path, params: { checkout: valid_attributes }
        expect(response).to redirect_to(checkout_success_path)
      end
    end

    context "with invalid parameters" do
      it "redirects to the cancelled order" do
        post checkout_brunch_path, params: { checkout: invalid_attributes }
        expect(response).to redirect_to(checkout_cancel_path)
      end
    end
  end

  describe "POST /donation" do
    context "with valid parameters" do
      it "redirects to the order validation" do
        post checkout_donation_path, params: { checkout: valid_attributes }
        expect(response).to redirect_to(checkout_success_path)
      end
    end

    context "with invalid parameters" do
      it "redirects to the cancelled order" do
        post checkout_donation_path, params: { checkout: invalid_attributes }
        expect(response).to redirect_to(checkout_cancel_path)
      end
    end
  end
end