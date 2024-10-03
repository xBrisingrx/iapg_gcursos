FactoryBot.define do
  factory :province do
    sequence(:name) { |n| "Chubut x#{n}" }
    active { true }
  end
end
