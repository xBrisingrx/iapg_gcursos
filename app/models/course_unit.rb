class CourseUnit < ApplicationRecord
  # aca tenemos la info del curso y las unidades/modulos que tiene
  # registramos quien lo dista, en que turno y que horario
  belongs_to :course
  belongs_to :unit
  belongs_to :instructor

  before_create :set_date
  after_create :generate_turns


  def schedule
    "De #{self.start_hour&.strftime("%k:%M")} a #{self.end_hour&.strftime("%k:%M")}"
  end

  def is_by_turn
    CourseTypeUnit.find_by(course_type: self.course.course_type, unit: self.unit).is_by_turn
  end

  def shift_time
    CourseTypeUnit.find_by(course_type: self.course.course_type, unit: self.unit).shift_time
  end

  private

  def set_date
    self.date = self.course.from_date + (self.day - 1).day
  end

  def generate_turns
    course_type_unit = CourseTypeUnit.find_by(course_type_id: self.course.course_type_id, unit_id: self.unit_id)
    return if !course_type_unit.is_by_turn
    turn_hour = self.start_hour
    date = self.date
    while turn_hour < self.end_hour
      Turn.create(
        course_id: self.course_id,
        unit_id: self.unit_id,
        date: date,
        hour: turn_hour
      )
      turn_hour += course_type_unit.shift_time.minutes
    end
  end
end
