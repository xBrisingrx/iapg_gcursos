class CompanyCategory < ApplicationRecord
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }
  validates :quota, presence: true, numericality: { only_integer: true }

  scope :actives, -> { where(active: true) }

  def self.filter(query)
    category = CompanyCategory.select(:id, :name, :description, :quota).actives
    if !query.blank?
      category = category
                .where("name LIKE ?", "%#{query}%")
                .or(CompanyCategory.where("description LIKE ?", "%#{query}%"))
                .or(CompanyCategory.where("quota LIKE ?", "%#{query}%"))
    end
    category.order(name: :asc)
  end
end
