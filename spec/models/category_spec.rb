require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'fields validation' do
    it 'needs name' do
      expect { Category.create!(name: nil) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'build category' do
      c = Category.new(name:"Lapon")
      expect(c).to be_valid
    end
  end
end