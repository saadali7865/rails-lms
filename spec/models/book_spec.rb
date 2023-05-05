require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new(title: 'My Book', category: :action) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:lend_books) }
  end

  describe 'enums' do
    it { should define_enum_for(:category).with_values([:horror, :action, :romantic]) }
  end

  describe 'scopes' do
    describe '.active' do
      it 'returns books with is_active=true' do
        active_book = create(:book, is_active: true)
        inactive_book = create(:book, is_active: false)

        expect(Book.active).to eq([active_book])
      end
    end
  end
end
