require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :value }
    it { is_expected.to have_db_column :article_id }
    it { is_expected.to have_db_column :user_id }

    describe 'Associations' do  
      it {is_expected.to belong_to :user}
      it {is_expected.to belong_to :article}
    end

    describe 'Validations' do
      it { is_expected.to validate_presence_of :value }
      it { is_expected.to validate_presence_of :article } 
      it { is_expected.to validate_length_of :user }
    end

    describe 'Factory' do
      it 'should have valid Factory' do
        expect(create(:article)).to be_valid 
      end
    end
  end

end
