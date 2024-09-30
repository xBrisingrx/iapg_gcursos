class Person < ApplicationRecord
  belongs_to :province, optional: true
  belongs_to :city, optional: true

  normalizes :email, with: ->(email) {  email.strip.downcase }

  validates :name, :last_name, :cuil, :birthdate, :phone, :celphone, :email, :direction, presence: true
  validates :cuil, uniqueness: true

  before_save :set_province

  scope :actives, -> { where(active: true) }

  def disable
    self.update(active: false)
  end

  def fullname
    "#{self.last_name} #{self.name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "active", "birthdate", "celphone", "city_id", "code", "created_at", "cuil", "direction", "email", "id", "id_value", "last_name", "name", "phone", "province_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "city", "province" ]
  end

  private
  def set_province
    self.province = Province.find(self.city.province.id) if !self.city_id.blank?
  end
end
