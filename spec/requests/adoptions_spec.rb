require 'rails_helper'

RSpec.describe "/adoptions", type: :request do
  before do 
    @cat = Cat.create(name:"Lapon", birth_date:Date.new(2017,3,12))
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_cat_adoption_path(@cat)
      expect(response).to be_truthy
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Adoption" do
        expect {
          post cat_adoptions_path(@cat), params: { cat_id: valid_attributes }
        }.to change(AdoptionForm, :count).by(1)
      end

      it "redirects to the cats index" do
        post cat_adoptions_path(@cat), params: { cat_id: valid_attributes }
        expect(response).to redirect_to(cats_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Association" do
        expect {
          post cat_adoptions_path(@cat), params: { cat_id: valid_attributes }
        }.to change(AdoptionForm, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cat_adoptions_path(@cat), params: { cat_id: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
