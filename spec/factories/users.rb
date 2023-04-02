FactoryBot.define do
  factory :user do
    pseudo { "John" }
    email { "johndoe@yopmail.com" }
    password { "1234567" }
    password_confirmation { "1234567" }
    is_admin { true }
  end
end