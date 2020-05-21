FactoryBot.define do
  factory :order do
    user
    name { user.name}
    address { user.default_address }
    phone { user.phone }
    total { "9.99" }

    trait :with_items do
      after :create do |order|
        menu_items = FactoryBot.create_list :menu_item, 3
        order.menu_items << menu_items
        order.save
      end
    end
  end
end
