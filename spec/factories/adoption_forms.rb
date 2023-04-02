FactoryBot.define do
  factory :adoption_form do
    first_name { "John" }
    last_name { "Doe" }
    email { "johndoe@yopmail.com" }
    phone_number { "0657575757" }
    cat { FactoryBot.create(:cat) }
  end
end
