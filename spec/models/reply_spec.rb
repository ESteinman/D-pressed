require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :content }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :content }
  end

  describe 'Associations' do  
    it {is_expected.to belong_to :article}
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :comment}
  end

  describe "Factory" do
    it "for :reply is valid" do
      expect(create(:reply)).to be_valid
    end
  end
end
