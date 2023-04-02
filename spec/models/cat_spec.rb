require 'rails_helper'

RSpec.describe Cat, type: :model do

  before do
    @cat = FactoryBot.create(:cat)
  end

  context "validation" do
    it "has a valid factory" do
      # teste toujours tes factories pour voir si elles sont valides
      expect(build(:cat)).to be_valid
    end

    it "is valid with valid attributes" do
      expect(@cat).to be_a(Cat)
    end

    describe "name" do
      it { expect(@cat).to validate_presence_of(:name) }
    end

    describe "birth_date" do
      it { expect(@cat).to validate_presence_of(:birth_date) }
    end
  end

  context "associations" do
    describe "adoption_forms" do
      #valide la présence du has_many :adoption_forms dans le modèle Cat
      it { expect(@cat).to have_many(:adoption_forms) }
    end
  end
end