require 'rails_helper'
require 'date'

RSpec.describe User, type: :model do
  before do 
    @user = User.create(pseudo: "John", email: "lisa@yopmail.com", password:"123456")
  end

  describe 'fields validation' do
    it 'needs title' do
      expect { User.create!(pseudo: nil, user:@user, date: DateTime.now) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
    end

    it 'needs date' do
      expect { Event.create!(title: "bonjour", user:@user, date: nil) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Date can't be blank")
    end

    it 'needs user' do
      expect { Event.create!(title: "bonjour", user: nil, date: DateTime.now) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User must exist")
    end
  end
end