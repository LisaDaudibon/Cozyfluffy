require 'rails_helper'

RSpec.describe "/menus", type: :request do
  before do
    @category = FactoryBot.create(:category)
    @product = FactoryBot.create(:product, category_id:@category.id)
  end

  describe 'GET / Index' do
    it 'returns success' do
      get menu_index_path

      expect(response).to have_http_status 200
    end
  end
end