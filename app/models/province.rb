class Province < ApplicationRecord
  has_many :cities

  validates :name, 
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 4 }
end
