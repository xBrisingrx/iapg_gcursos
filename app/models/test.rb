class Test < ApplicationRecord
  # enum instance: [ "Primer instancia", "Recuperatorio" ]
  # enum fleet: [ "Liviana", "Pesada" ]
  # enum modality: [ "Práctico", "Teórico", "Psicométrico" ]

  scope :actives, -> { where(active: true) }

  def disable
    self.update(active: false)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end
end
