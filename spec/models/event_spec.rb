require 'rails_helper'
require 'date'

RSpec.describe Event, type: :model do
  before do 
    @event = FactoryBot.create(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end
  
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(@event).to be_a(Event)
    end 

    describe 'title' do
      it {expect(@event).to validate_presence_of(:title)}
    end 

    describe 'date' do
      it {expect(@event).to validate_presence_of(:date)}
    end 
  end 

  context "public instance methods" do

    describe "title" do
      it "should return a string" do
        expect(@event.title).to be_a(String)
      end
    end

  end

end