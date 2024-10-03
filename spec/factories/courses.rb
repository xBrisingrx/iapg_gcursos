FactoryBot.define do
  factory :course do
    date { "2024-10-03" }
    year_number { 1 }
    general_number { 1 }
    is_company { false }
    course_type { nil }
    room { nil }
    company { nil }
    active { false }
  end
end
