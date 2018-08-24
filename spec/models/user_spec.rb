require 'rails_helper'

RSpec.describe User, type: :model do
  describe "DB table" do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
  end


  describe 'Associations' do  
    it {is_expected.to have_many :articles}
    it {is_expected.to have_many :ratings}
    it {is_expected.to have_many :comments}
  end

  describe "Factory" do
    it "for :user is valid" do
      expect(create(:user)).to be_valid
    end
  end

  describe 'User roles' do
    let(:basic_user) {create :user, role: :basic_user}
    let(:subscriber) {create :user, role: :subscriber}
    let(:author) {create :user, role: :author}
    let(:editor) {create :user, role: :editor}

    it 'basic_user responds true if role is basic_user' do
      expect(basic_user.basic_user?).to eq true
    end

    it 'basic_user responds false if role is not basic_user' do
      expect(subscriber.basic_user?).to eq false
    end
    
    it 'subscriber responds true if role is subscriber' do
      expect(subscriber.subscriber?).to eq true
    end

    it 'subscriber responds false if role is not basic_user' do
      expect(subscriber.basic_user?).to eq false
    end

    it 'author responds true if role is author' do
      expect(author.author?).to eq true
    end

    it 'author responds false if role is not author' do
      expect(author.basic_user?).to eq false
    end

    it 'editor responds true if role is subscriber' do
      expect(editor.editor?).to eq true
    end

    it 'editor responds false if role is not editor' do
      expect(editor.basic_user?).to eq false
    end
  end
end
