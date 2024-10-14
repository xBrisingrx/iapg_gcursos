class CourseInstructorUnit < ApplicationRecord
  belongs_to :course
  belongs_to :intructor
  belongs_to :unit
end
