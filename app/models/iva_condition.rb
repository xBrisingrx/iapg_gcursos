class IvaCondition < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }

  scope :actives, -> { where(active: true) }

  def self.filter(query)
    sector = IvaCondition.select(:id, :name, :description).actives
    if !query.blank?
      sector = sector
                .where("name LIKE ?", "%#{query}%")
                .or(IvaCondition.where("description LIKE ?", "%#{query}%"))
    end
    sector.order(name: :asc)
  end
end
