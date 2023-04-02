require 'date'

FactoryBot.define do
  factory :event do
    title { "Lapin" }
    date { DateTime.now }
    user { FactoryBot.create(:user) }
  end
end
