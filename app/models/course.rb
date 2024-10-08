class Course < ApplicationRecord
  belongs_to :course_type
  belongs_to :room
  belongs_to :company, optional: true

  validates :year_number, :general_number, uniqueness: { scope: :course_type_id ,allow_blank: true }
  # validates :company_id, required: 

  scope :actives, -> { where(active: true) }
  scope :count_general_number, -> (course_type_id) { where( active:true ).where( course_type_id: course_type_id ).count }
  scope :by_year, -> (year) { where('extract(year from created_at) = ?', year) }

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
