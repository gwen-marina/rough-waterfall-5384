require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many(:customer_items) }
    it { should have_many(:items).through(:customer_items) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'instance methods' do
    it 'shows the total price of all items' do 

    mark1 = Supermarket.create!(name: "The Butcher Block", location: "Tucson")
    mark2 = Supermarket.create!(name: "Shop and Save", location: "Vail")
    cust1 = Customer.create!(name: "Smudger Ruiz", supermarket_id: mark1.id)
    cust2 = Customer.create!(name: "Oliver Williams", supermarket_id: mark2.id)

    cust1.items.create!(name: "steak", price: 20)
    cust1.items.create!(name: "chicken", price: 10)
    cust1.items.create!(name: "salmon", price: 15)

    cust2.items.create!(name: "cereal", price: 6)
    cust2.items.create!(name: "candy", price: 1)
    cust2.items.create!(name: "toaster strudel", price: 5)

    expect(cust1.total_price).to eq(45.00)
    expect(cust2.total_price).to eq(12.00)
    end
  end
end