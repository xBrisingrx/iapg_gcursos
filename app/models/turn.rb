class Turn < ApplicationRecord
  belongs_to :course
  belongs_to :person, optional: true
  belongs_to :course_unit

  enum status: [ :available, :busy, :reserved ]
end
