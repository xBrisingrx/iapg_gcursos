provinces = JSON.parse(File.read(Rails.root.join('db/seeds/provinces.json')))
cities = JSON.parse(File.read(Rails.root.join('db/seeds/cities.json')))

provinces.each do |province|
  Province.create(id: province['id'], name: province['name'])
end

cities.each do |city|
  City.create(id: city['id'], name: city['name'], province_id: city['province_id'])
end

IvaCondition.create(name: "Excento")
IvaCondition.create(name: "Responsable incripto")
Sector.create(name: "Rubro uno")
Sector.create(name: "Rubro dos")
CompanyCategory.create(name: "Categoría uno", quota: 10)
CompanyCategory.create(name: "Categoría dos", quota: 5)
CompanyCategory.create(name: "Categoría tres", quota: 0)
Sectional.create(name: "Sur", direction: "Moyano 420", city_id: 449)
Sectional.create(name: "Comahue", direction: "Sin domicilio", city_id: 1546)
Headquarter.create(name: "KM3", description: "Sede central, IAPG", city_id: 449, sectional_id: 1, can_make_psychometric: true)
Headquarter.create(name: "Neuquen", description: "", city_id: 1546, sectional_id: 2, can_make_psychometric: true)
Company.create(cuit: "20301204321", name: "Snoopy OIL", iva_condition_id: 1, direction: "Ramon Reina 644", phone: "2974039281", operator: true, city_id: 449, sector_id: 1, company_category_id: 1)
Company.create(cuit: "20309804671", name: "Nala OIL", iva_condition_id: 2, direction: "12 de octubre 1445", phone: "2975130120", operator: true, city_id: 449, sector_id: 2, company_category_id: 2)
Room.create(headquarter_id: 1, name: "Inst. Arg. del Pet. y del Gas", capacity: 25, description: "Gobernador Moyano 420")
Room.create(headquarter_id: 2, name: "Central Comahue", capacity: 30, description: "Comahue")
Unit.create(name: "Módulo uno", description: "Teoría del módulo uno", fleet: "Liviana", methodology: "Presencial", category: "Teórico")
Unit.create(name: "Módulo Práctico", description: "Práctica del módulo uno", fleet: "Liviana", methodology: "Presencial", category: "Práctico")
Unit.create(name: "Módulo Psicométrico", description: "Módulo Psicométrico", fleet: "Liviana", methodology: "Presencial", category: "Psicométrico")
InscriptionMotive.create(name: 'Nuevo ingreso')
InscriptionMotive.create(name: 'Cambio categoría')
InscriptionMotive.create(name: 'Scoring')
FleetCategory.create(name: 'Automovil')
FleetCategory.create(name: 'Camioneta 4x2')
FleetCategory.create(name: 'Camioneta 4x4')
