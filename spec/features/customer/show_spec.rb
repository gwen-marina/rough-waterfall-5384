require 'rails_helper'

RSpec.describe 'Customer Show Page', type: :feature do 

  it "can list items and the name of supermarket they belong to" do 
    
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

    visit "/customers/#{cust1.id}"

    expect(page).to have_content("supermarket: The Butcher Block")
    expect(page).to have_content("item name: steak")
    expect(page).to have_content("price: $20.00")
    expect(page).to have_content("item name: chicken")
    expect(page).to have_content("price: $10.00")
    expect(page).to have_content("item name: salmon")
    expect(page).to have_content("price: $15.00")

    visit "/customers/#{cust2.id}"

    expect(page).to have_content("supermarket: Shop and Save")
    expect(page).to have_content("item name: cereal")
    expect(page).to have_content("price: $6.00")
    expect(page).to have_content("item name: candy")
    expect(page).to have_content("price: $1.00")
    expect(page).to have_content("item name: toaster strudel")
    expect(page).to have_content("price: $5.00")
  end

  it "can list the total price of all its items" do 
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

    visit "/customers/#{cust1.id}"

    expect(page).to have_content("total price of items: $45.00")

    visit "/customers/#{cust2.id}"

    expect(page).to have_content("total price of items: $12.00")
  end

end