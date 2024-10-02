class CourseType < ApplicationRecord
  belongs_to :room
  validates :name, :description, :min_quota, :max_quota, :min_score, :max_score, :passing_score, :number_of_repeat, :fleet, presence: true
  validates :min_quota, :max_quota, :min_score, :max_score, :passing_score, :number_of_repeat, numericality: { only_integer: true }

  scope :actives, -> { where(active: true) }

  enum :fleet, [ :light, :heavy ] # discriminamos si el tipo de curso es de flota liviana o pesada

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description", "min_quota", "max_quota", "min_score", "max_score", "passing_score", "number_of_repeat", "room_id", "need_code" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "room" ]
  end

  def disable
    self.update(active: false)
  end
end
