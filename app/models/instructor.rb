class Instructor < ApplicationRecord
  scope :actives, -> { where(active: true) }

  def disable
    self.update(active: false)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "description" ]
  end
end
