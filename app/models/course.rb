class Course < ApplicationRecord
  belongs_to :course_type
  belongs_to :room
  belongs_to :company, optional: true

  scope :actives, -> { where(active: true) }

  def disable
    self.update(active: false)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "date", "room_id", "company_id", "course_type_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "room", "company", "course_type" ]
  end
end
