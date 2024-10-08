class CourseTypeUnit < ApplicationRecord
  belongs_to :course_type
  belongs_to :unit

  def schedule
    if self.start_brake?
      "De #{self.start_hour.strftime("%k:%M")} a #{self.start_brake.strftime("%k:%M")} y de #{self.end_brake.strftime("%k:%M")} a #{self.end_hour.strftime("%k:%M")}"
    else
      "De #{self.start_hour.strftime("%k:%M")} a #{self.end_hour.strftime("%k:%M")}"
    end
  end
end
