class Sectional < ApplicationRecord
  belongs_to :city
  belongs_to :province

  validates :name, :direction, presence: true
  
  before_validation :set_province

  scope :actives, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "direction", "province_id", "city_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "city", "province" ]
  end

  private
  def set_province
    self.province = self.city.province if !self.city_id.blank?
  end
end
