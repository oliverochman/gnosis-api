require 'rails_helper'

RSpec.describe RegistrationKey, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :combination }
	end 

  describe 'Validations' do
    it { is_expected.to validate_presence_of :combination }  
  end

  describe 'Association' do
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:registration_key)).to be_valid
    end
  end
end
