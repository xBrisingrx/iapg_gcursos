class CourseTypeUnit < ApplicationRecord
  belongs_to :course_type
  belongs_to :unit

  def schedule
    "De #{self.start_hour&.strftime("%k:%M")} a #{self.end_hour&.strftime("%k:%M")}"
  end

  def calc_quota # calculamos cuantos cupos entran en un turno
    return "--" if !self.is_by_turn
    diff_in_minutes = (self.end_hour - self.start_hour) / 60
    (diff_in_minutes / self.shift_time).to_i
  end
end
