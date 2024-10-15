class CoursePerson < ApplicationRecord
  belongs_to :course
  belongs_to :person
  belongs_to :manager, class_name: "Person"
  belongs_to :company
  belongs_to :operator, class_name: "Company"
  belongs_to :inscription_motive
  belongs_to :fleet_category
  belongs_to :unit

  after_create :assign_turn

  private
  def assign_turn
    return if self.course.course_type.days == 1 || CoursePerson.where(course_id: self.course_id, person_id: self.person_id).count > 1
    units = CourseTypeUnit.where(course_type_id: self.course.course_type_id).where.not(unit_id: self.unit_id)
    course_date = self.course.from_date
    units.each do |unit|
      course_person = CoursePerson.new(
        course_id: self.course_id,
        person_id: self.person_id,
        manager_id: self.manager_id,
        company_id: self.company_id,
        operator_id: self.operator_id,
        inscription_motive_id: self.inscription_motive_id,
        fleet_category_id: self.fleet_category_id,
        unit_id: unit.unit_id
      )
      course_person.date = course_date + (unit.day - 1).day
      if unit.is_by_turn
        course_person.hour = set_hour(unit.unit_id, self.course_id, self.date, unit.shift_time)
      end
      course_person.save
    end
  end

  def set_hour(unit_id, course_id, date, shift_time)
    # seteamos la hora si es que el modulo va por turnos
    # debemos tener en cuenta que no se pise con turnos de otros ni con un turno q tenga esta persona
    # ya que el mismo dia puede tener practica y psicometrico
    turn_available = Turn.where(course_id: course_id, unit_id: unit_id, available: true)
    turn_hour = nil
    turn_available.each do |turn|
      if self.person_is_available(shift_time, date, turn.hour)
        turn_hour = turn.hour
        turn.update(available: false)
      end
      break if !turn_hour.blank?
    end
    turn_hour
  end

  def person_is_available(shift_time, date, hour)
    # la persona esta disponible en este horario
    end_hour = hour + shift_time.minutes
    cp = CoursePerson
          .where(person_id: self.person_id)
          .where(date: date)
          .where("hour >= ?", hour)
          .where("hour < ?", end_hour)
    debugger
    cp.empty?
  end
end
