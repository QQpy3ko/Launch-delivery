FactoryBot.define do
  factory :menu_item do
    title { "MyString" }
    price { "9.99" }
    active { false }
    category { nil }
    order { nil }
  end
end
