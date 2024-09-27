FactoryBot.define do
  factory :city do
    name { "Comodoro Rivadavia" }
    province { association :province } 
    active { true }
  end
end