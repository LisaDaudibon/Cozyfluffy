require 'rails_helper'

RSpec.describe Category, type: :model do

  before do 
    @category = FactoryBot.create(:category)
  end

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@category).to be_a(Category)
    end 

    describe 'name' do
      it {expect(@category).to validate_presence_of(:name)}
    end 
  end 

  context "associations" do
    describe "products" do
      it { expect(@category).to have_many(:products) }
    end
  end

  context "public instance methods" do

    describe "name" do
      it "should return a string" do
        expect(@category.name).to be_a(String)
      end
    end
  end
end 