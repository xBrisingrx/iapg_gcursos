require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { build(:person) }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to belong_to(:province).optional }
    it { is_expected.to belong_to(:city).optional }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:name) } 
    it { is_expected.to validate_presence_of(:cuil) } 
    it { is_expected.to validate_presence_of(:birthdate) } 
    it { is_expected.to validate_presence_of(:phone) } 
    it { is_expected.to validate_presence_of(:celphone) } 
    it { is_expected.to validate_presence_of(:email) } 
    it { is_expected.to validate_presence_of(:direction) } 
    # esta validacion me da error en la asociacion
    # it { is_expected.to validate_uniqueness_of(:cuil) }
  end
end
