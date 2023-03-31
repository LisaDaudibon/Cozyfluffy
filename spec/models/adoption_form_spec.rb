require 'rails_helper'
require 'date'

RSpec.describe AdoptionForm, type: :model do
  before do 
    @cat = Cat.create(name:"Lapon", birth_date:Date.new(2017,3,12))
  end

  describe 'fields validation' do
    it 'needs first_name' do
      expect { AdoptionForm.create!(first_name: nil, last_name: "Maxime", email: "lisa@yopmail.com", phone_number: "06 05 45 57 67", cat:@cat) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: First name can't be blank")
    end

    it 'needs last_name' do
      expect { AdoptionForm.create!(first_name: "John", last_name: nil, email: "lisa@yopmail.com", phone_number: "06 05 45 57 67", cat:@cat) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Last name can't be blank")
    end

    it 'needs email' do
      expect { AdoptionForm.create!(first_name: "John", last_name: "Maxime", email: nil, phone_number: "06 05 45 57 67", cat:@cat) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank, Email n'a pas le bon format mon coco ! ")
    end

    it 'needs email to have the right format' do
      expect { AdoptionForm.create!(first_name: "John", last_name: "Maxime", email: "lisa@yopmail.", phone_number: "06 05 45 57 67", cat:@cat) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email n'a pas le bon format mon coco ! ")
    end

    it 'needs phone_number' do
      expect { AdoptionForm.create!(first_name: "John", last_name: "Maxime", email: "lisa@yopmail.com", phone_number: nil, cat:@cat) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Phone number can't be blank")
    end

    it 'needs cat' do
      expect { AdoptionForm.create!(first_name: "John", last_name: "Maxime", email: "lisa@yopmail.com", phone_number: "06 05 45 57 67", cat:nil) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Cat must exist")
    end

    it 'build adoption_form' do
      a = AdoptionForm.new(first_name: "John", last_name: "Maxime", email: "lisa@yopmail.com", phone_number: "06 05 45 57 67", cat:@cat)
      expect(a).to be_valid
    end
  end
end