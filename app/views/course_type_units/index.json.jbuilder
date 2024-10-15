json.data @course_type_units do |course_type_unit|
  json.id course_type_unit.id
  json.day course_type_unit.day
  json.unit course_type_unit.unit.name
  json.unit_id course_type_unit.unit_id
end
