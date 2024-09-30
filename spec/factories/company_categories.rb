FactoryBot.define do
  factory :company_category do
    name { "MyString" }
    description { "MyString" }
    quota { 1 }
    active { false }
  end
end
