class Headquarter < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }

  scope :actives, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description" ]
  end
end
