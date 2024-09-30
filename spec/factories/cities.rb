FactoryBot.define do
  factory :city do
    name { "Comodoro Rivadavia" }
    province { association :province }
    active { true }
  end

  trait :madryn do
    name { "Puerto Madryn" }
  end
end
