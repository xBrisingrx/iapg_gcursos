class CoursesUnit < ApplicationRecord
  belongs_to :course
  belongs_to :unit
  belongs_to :intructor
end
