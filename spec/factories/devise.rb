FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    default_address { Faker::Address.full_address }
    password { "password1234" }
    email { Faker::Internet.email }
  end

  factory :admin, class: User do
    password { "password1234" }
    email { "adminus@example.com" }
    name { "Volodmin" }
    phone { "+11234343445" }
    admin { true }
  end

  factory :second_user, class: User do
    password { "pass1234asd" }
    email { "testivan123@example.com" }
    name { "Testivan" }
    phone { "+11134343446" }
  end
end
