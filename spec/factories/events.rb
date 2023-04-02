require 'date'

FactoryBot.define do
  factory :event do
    title { "Lapin" }
    date { DateTime.now }
    association :user 
  end 
end
