FactoryBot.define do
  factory :user do
    id {1}
    password { "password1234" }
    email { "testuanna1@example.com" }
    name { "Testuanna" }
    phone { "+11134343445" }
  end

  factory :admin, class: User do
    id {2}
    password { "password1234" }
    email { "adminus@example.com" }
    name { "Volodmin" }
    phone { "+11234343445" }
  end

  factory :second_user, class: User do
    id {3}
    password { "pass1234asd" }
    email { "testivan123@example.com" }
    name { "Testivan" }
    phone { "+11134343446" }
  end
end
