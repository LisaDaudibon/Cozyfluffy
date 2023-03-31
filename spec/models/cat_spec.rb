require 'rails_helper'
require 'date'

RSpec.describe Cat, type: :model do
  describe 'fields validation' do
    it 'needs name' do
      expect { Cat.create!(name: nil, birth_date:Date.new(2017,3,12), description:"La maman du salon, elle supervise tout avec bienveillance", adoption:"true", image_url:"https://images.unsplash.com/photo-1491485880348-85d48a9e5312?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80") }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end

    it 'needs birth_date' do
      expect { Cat.create!(name: "John", birth_date: nil, description:"La maman du salon, elle supervise tout avec bienveillance", adoption:"true", image_url:"https://images.unsplash.com/photo-1491485880348-85d48a9e5312?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80") }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Birth date can't be blank")
    end

    it 'build cat' do
      c = Cat.new(name:"Lapon", birth_date:Date.new(2017,3,12))
      expect(c).to be_valid
    end
  end
end