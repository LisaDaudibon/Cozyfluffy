require 'rails_helper'

RSpec.describe "/cats/:cat_id/adoptions", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

=begin
  describe "GET /new" do
    it "renders a successful response" do
      get new_cat_adoption_path
      expect(response).to be_truthy
    end
  end
=end
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Adoption" do
        expect {
          post cat_adoptions_path, params: { adoption_form: valid_attributes }
        }.to change(AdoptionForm, :count).by(1)
      end

      it "redirects to the cats index" do
        post cat_adoptions_path, params: { adoption_form: valid_attributes }
        expect(response).to redirect_to(cats_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Association" do
        expect {
          post cat_adoptions_path, params: { adoption_form: valid_attributes }
        }.to change(AdoptionForm, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cat_adoptions_path, params: { adoption_form: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
