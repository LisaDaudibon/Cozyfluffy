require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = FactoryBot.create(:user)
  end

  describe 'username' do
    it "needs email" do
      invalid_user = FactoryBot.build(:user, email:nil)
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:email)).to eq(true)
    end

    it "needs email to be unique" do
      invalid_user = FactoryBot.build(:user, email:"johndoe@yopmail.com")
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:email)).to eq(true)
    end

    it "needs password" do
      invalid_user = FactoryBot.build(:user, password:nil)
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:password)).to eq(true)
    end

    it "needs password_confirmation to be the same as the password" do
      invalid_user = FactoryBot.build(:user, password_confirmation:"123")
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors.include?(:password_confirmation)).to eq(true)
    end

    it 'build user' do
      u = User.create!(pseudo: "John", email: "valentin@yopmail.com", password:"123456")
      expect(u).to be_valid
    end
  end
end