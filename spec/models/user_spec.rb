require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user, email:"john@yopmail.com")).to be_valid
  end

  describe "needs email" do
    it { expect(@user).to validate_presence_of(:email) }
  end

  describe 'user' do
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
  end
end