FactoryBot.define do
  factory :person do
    sequence(:cuil) { |n| "1122334#{n}" }
    last_name { "Bromson" }
    name { "Eragon" }
    birthdate { "1990-01-10" }
    phone { "2974112233" }
    celphone { "2974112233" }
    email { "eragon@test.com" }
    direction { "Siempre viva 123" }
    code { "TEST01" }
    province { association :province }
    city { association :city }
    active { true }
  end

  trait :person2 do
    city { association :madryn }
  end
end
