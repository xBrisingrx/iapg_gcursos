json.data @course_type_units do |course_type_unit|
  json.id course_type_unit.id
  json.day course_type_unit.day
  json.unit course_type_unit.unit.name
  json.unit_id course_type_unit.unit_id
  json.start_hour course_type_unit.start_hour.strftime("%H:%M")
  json.end_hour course_type_unit.end_hour.strftime("%H:%M")
end
