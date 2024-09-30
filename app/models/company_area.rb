class CompanyArea < ApplicationRecord
  validates :name, 
    presence: true,
    uniqueness: { case_sensitive: false }

  scope :actives, ->{ where(active: true) }

  def self.filter(query)
    return CompanyArea.select(:id, :name, :description).actives if query.blank?
    CompanyArea.select(:id, :name, :description)
      .where('name LIKE ?', "%#{query}%")
      .or(CompanyArea.where('description LIKE ?', "%#{query}%"))
      .order(name: :asc)
  end
end
