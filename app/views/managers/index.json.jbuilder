json.data @managers do |manager|
  json.id manager.id
  json.person_id manager.person_id
  json.name manager.person.fullname
end
