FactoryBot.define do
  factory :product do
    name { "Chocolat" }
    price { "5.0" }
    association :category
  end
end
