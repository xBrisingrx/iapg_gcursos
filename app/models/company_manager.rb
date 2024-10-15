class CompanyManager < ApplicationRecord
  # referentes de la empresa
  belongs_to :company
  belongs_to :person
end
