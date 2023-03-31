require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.create(pseudo: "John", email: "lisa@yopmail.com", password:"123456")
  end

  describe 'fields validation' do
    it 'needs email' do
      expect { User.create!(pseudo: "John", email: nil, password:"123456") }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
    end

    it 'needs password' do
      expect { User.create!(pseudo: "John", email: "valentin@yopmail.com", password:nil) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password can't be blank")
    end

    it 'needs password_confirmation to be the same as password' do
      expect { User.create!(pseudo: "John", email: "valentin@yopmail.com", password:"123456", password_confirmation: "123") }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password confirmation doesn't match Password")
    end

    it 'needs email to be unique' do
      expect { User.create!(pseudo: "John", email: "lisa@yopmail.com", password:"123456") }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken")
    end

    it 'build user' do
      u = User.create!(pseudo: "John", email: "valentin@yopmail.com", password:"123456")
      expect(u).to be_valid
    end
  end
end