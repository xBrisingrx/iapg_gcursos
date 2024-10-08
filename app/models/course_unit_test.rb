class CourseUnitTest < ApplicationRecord
  belongs_to :test
  belongs_to :course_unit

  scope :actives, -> { where(active: true) }
end
