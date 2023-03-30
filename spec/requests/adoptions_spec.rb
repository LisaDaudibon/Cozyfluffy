require 'rails_helper'

RSpec.describe "Adoptions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/adoptions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/adoptions/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/adoptions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/adoptions/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
