class CourseInstructor < ApplicationRecord
  belongs_to :course
  belongs_to :instructor
  belongs_to :unit

  after_create :generate_turns

  private
  def generate_turns
    return if !CourseTypeUnit.find_by(course_type_id: self.course.course_type_id, unit_id: self.unit_id).is_by_turn
    unit_shift_data = CourseTypeUnit.find_by(course_type_id: self.course.course_type_id, unit_id: self.unit_id)
    turn_hour = unit_shift_data.start_hour
    date = self.course.from_date + (unit_shift_data.day - 1).day
    while turn_hour < unit_shift_data.end_hour
      Turn.create(
        course_id: self.course_id,
        unit_id: self.unit_id,
        date: date,
        hour: turn_hour
      )
      turn_hour += unit_shift_data.shift_time.minutes
      # en algun momento la hora es la de comienzo del brake, ahi salteamos y pasamos derecho a cuanto retoman los turnos
      if turn_hour == unit_shift_data.start_brake
        turn_hour = unit_shift_data.end_brake
      end
    end
  end
end
