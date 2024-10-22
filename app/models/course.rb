class Course < ApplicationRecord
  belongs_to :course_type
  belongs_to :room
  belongs_to :company, optional: true
  has_many :course_instructors, dependent: :destroy
  has_many :instructors, through: :course_instructors
  has_many :units, through: :course_instructors
  has_many :course_people, dependent: :destroy
  has_many :people, through: :course_people
  has_many :turns, dependent: :destroy

  accepts_nested_attributes_for :course_instructors

  validates :year_number, :general_number, uniqueness: { scope: :course_type_id, allow_blank: true }
  validates :from_date, presence: true
  # validates :company_id, required:

  scope :actives, -> { where(active: true) }
  scope :count_general_number, ->(course_type_id) { where(active: true).where(course_type_id: course_type_id).count }
  scope :by_year, ->(year) { where("extract(year from created_at) = ?", year) }

  after_create :set_to_date

  def disable
    self.update(active: false)
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "date", "room_id", "company_id", "course_type_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "room", "company", "course_type" ]
  end

  private
  def instructor_available
    # tengo que buscar los cursos de cierta fecha y ahi ver que no este mi instructor en ese curso
    Course.where(date: date).joins(:course_instructors).where(course_instructors: { instructor_id: instructor_id }).count == 0
  end

  def set_to_date
    days = self.course_type.days - 1
    self.update(to_date: self.from_date + days.day)
  end
end
