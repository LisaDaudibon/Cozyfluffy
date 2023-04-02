require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  context "validation" do
    it "has a valid factory" do
      # teste toujours tes factories pour voir si elles sont valides
      expect(build(:user, email:"john@yopmail.com")).to be_valid
    end

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "email" do
      it { expect(@user).to validate_presence_of(:email) }
    end

    describe "password" do
      it { expect(@user).to validate_presence_of(:password) }
    end

    describe "password_confirmation matches the password" do
      #valide que le mot de passe et la confirmation du mot de passe sont bien identique
      it { should validate_confirmation_of(:password) }
    end

    describe 'email uniqueness for user' do
      it "needs email to be unique" do
        invalid_user = FactoryBot.build(:user, email:"johndoe@yopmail.com")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:email)).to eq(true)
      end
    end
  end

  context "associations" do
    describe "events" do
      #valide la présence du has_many :events dans le modèle User
      it { expect(@user).to have_many(:events) }
    end
  end
end