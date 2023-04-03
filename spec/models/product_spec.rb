require 'rails_helper'

RSpec.describe Product, type: :model do
  before do 
    @product = FactoryBot.create(:product)
  end

  it "has a valid factory" do
    expect(build(:product, name: "Matcha Latte")).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@product).to be_a(Product)
    end 

    describe 'name' do
      it {expect(@product).to validate_presence_of(:name)}
    end 

    describe 'price' do
      it {expect(@product).to validate_presence_of(:price)}
    end 

    describe 'name uniqueness' do
      it "needs name to be unique" do
        invalid_name = FactoryBot.build(:product, name:"")
        expect(invalid_name).not_to be_valid
        expect(invalid_name.errors.include?(:name)).to eq(true)
      end
    end
  end 

  context "public instance methods" do

    describe "price" do
      it "should return a float" do
        expect(@product.price).to be_a(Float)
      end
    end

    describe "name" do
      it "should return a string" do
        expect(@product.name).to be_a(String)
      end
    end
  end
end 