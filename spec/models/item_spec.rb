require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end
end