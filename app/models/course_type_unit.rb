class CourseTypeUnit < ApplicationRecord
  belongs_to :course_type
  belongs_to :unit

  def schedule
    "De #{self.start_hour&.strftime("%k:%M")} a #{self.end_hour&.strftime("%k:%M")}"
  end
end
