require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @category = Category.create(name:"lapin")
    @product = Product.create(name:"Expresso", price: "5.0", category:@category)
  end

  describe 'fields validation' do
    it 'needs name' do
      expect { Product.create!(name: nil, price: "5.0", category:@category) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'needs name to be unique' do
      expect { Product.create!(name: "Expresso", price: "5.0", category:@category) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name has already been taken")
    end

    it 'needs price' do
      expect { Product.create!(name: "Margarita", price:nil, category:@category) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Price can't be blank")
    end

    it 'needs category' do
      expect { Product.create!(name: "Margarita", price:"5,50", category: nil) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Category must exist")
    end

    it 'build product' do
      p = Product.new(name:"Margarita", price: "6,50", category:@category)
      expect(p).to be_valid
    end
  end
end