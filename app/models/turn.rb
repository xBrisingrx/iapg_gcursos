class Turn < ApplicationRecord
  belongs_to :course
  belongs_to :person, optional: true
end
