class City < ApplicationRecord
  belongs_to :province

  validates :name, 
    presence: true,
    uniqueness: { case_sensitive: false, scope: :province_id }
  
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name" ]
  end
end
