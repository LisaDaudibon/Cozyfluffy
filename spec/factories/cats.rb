FactoryBot.define do
  factory :cat do
    pseudo { "John" }
    birth_date { DateTime.now }
  end
end
