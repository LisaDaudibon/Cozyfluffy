require 'rails_helper'

RSpec.describe "/association", type: :request do
  before do
    @event = FactoryBot.create(:event)
  end

  describe 'GET / Index' do
    it 'returns success' do
      get association_index_path

      expect(response).to have_http_status 200
    end
  end

  describe 'GET / Show' do
    it 'returns success' do
      get association_path(@event.id)

      expect(response).to have_http_status 200
    end
  end


  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_association_path
      expect(response).to be_truthy
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      association = Event.create! valid_attributes
      get edit_association(association)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Association" do
        expect {
          post association_index_path, params: { association: valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created association" do
        post association_index_path, params: { association: valid_attributes }
        expect(response).to redirect_to(association_path(association))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Association" do
        expect {
          post association_index_url, params: { association: invalid_attributes }
        }.to change(Event, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post association_index_path, params: { association: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested event" do
        association = Event.create! valid_attributes
        patch association_url(association), params: { association: new_attributes }
        event.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the event" do
        association = Event.create! valid_attributes
        patch association_url(association), params: { association: new_attributes }
        association.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context "with invalid parameters" do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        association = Event.create! valid_attributes
        patch association_url(association), params: { association: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested event" do
      association = Event.create! valid_attributes
      expect {
        delete association_path(association)
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete association_url(association)
      expect(response).to redirect_to(association_index_path)
    end
  end
end
