FactoryBot.define do
  factory :person do
    cuil { "MyString" }
    last_name { "MyString" }
    name { "MyString" }
    birthdate { "2024-09-05" }
    phone { "MyString" }
    celphone { "MyString" }
    email { "MyString" }
    direction { "MyString" }
    code { "MyString" }
    province { nil }
    city { nil }
    active { false }
  end
end
