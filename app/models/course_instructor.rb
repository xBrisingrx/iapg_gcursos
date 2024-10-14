class CourseInstructor < ApplicationRecord
  belongs_to :course
  belongs_to :instructor
  belongs_to :unit
end
