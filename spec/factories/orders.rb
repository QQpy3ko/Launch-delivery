FactoryBot.define do
  factory :order do
    total { "9.99" }
    address { "MyString" }
    phone { "MyString" }
    user { nil }
  end
end
