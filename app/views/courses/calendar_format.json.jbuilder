json.data @courses do |course|
	json.title course.course_type.name
  json.start course.from_date.strftime('%Y-%m-%d')
  json.end course.to_date.strftime('%Y-%m-%d')
end
