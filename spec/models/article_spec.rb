require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :created_at }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body } 
    it { is_expected.to validate_length_of :title }
  end

  describe 'Associations' do  
    it {is_expected.to belong_to :user}
    it {is_expected.to have_many :ratings}
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid 
    end
  end

  describe 'Attachment' do
    it 'is valid  ' do
      subject.image.attach(io: File.open(fixture_path + '/dummy.jpeg'), filename: 'attachment.jpg', content_type: 'image/jpeg')
      expect(subject.image).to be_attached
    end
  end
end