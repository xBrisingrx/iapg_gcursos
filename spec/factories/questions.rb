FactoryBot.define do
  factory :question do
    name { "MyString" }
    fleet { "MyString" }
    eliminating { false }
    score { 1 }
    active { false }
  end
end
