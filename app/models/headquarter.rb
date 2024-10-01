class Headquarter < ApplicationRecord
  belongs_to :city
  belongs_to :province
  belongs_to :sectional

  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false }

  before_validation :set_province

  scope :actives, -> { where(active: true) }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description", "province_id", "city_id", "sectional_id", "can_make_psychometric" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "sectional", "city", "province" ]
  end

  private
  def set_province
    self.province = self.city.province if !self.city_id.blank?
  end
end
