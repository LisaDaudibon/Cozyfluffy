FactoryBot.define do
  factory :cat do
    name { "John" }
    birth_date { DateTime.now }
  end
end
