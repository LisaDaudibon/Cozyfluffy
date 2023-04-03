require 'rails_helper'
require 'date'

RSpec.describe AdoptionForm, type: :model do
  before do 
    @adoption_form = FactoryBot.create(:adoption_form)
  end

  it 'has a valid factory' do
    expect(build(:adoption_form)).to be_valid
  end

  context 'validation' do
    it 'is valid with valid attributes' do
      expect(@adoption_form).to be_a(AdoptionForm)
    end 

    describe 'first_name' do
      it {expect(@adoption_form).to validate_presence_of(:first_name)}
    end

    describe 'last_name' do
      it {expect(@adoption_form).to validate_presence_of(:last_name)}
    end

    describe 'email' do
      it {expect(@adoption_form).to validate_presence_of(:email)}
    end

    describe 'phone_number' do
      it {expect(@adoption_form).to validate_presence_of(:phone_number)}
    end

  end

  context "public instance methods" do

    describe "first name" do
      it "should return a string" do
        expect(@adoption_form.first_name).to be_a(String)
      end
    end

    describe "last name" do
      it "should return a string" do
        expect(@adoption_form.last_name).to be_a(String)
      end
    end

    describe "phone number" do
      it "should return a integer" do
        expect(@adoption_form.phone_number).to be_a(Integer)
      end
    end

    describe "email" do
      it "should return a string" do
        expect(@adoption_form.email).to be_a(String)
      end
    end
  end
end