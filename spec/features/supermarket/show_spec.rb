require 'rails_helper'

RSpec.describe 'Supermarket Show Page', type: :feature do 

  it "can list the name of the supermarket" do 

    mark1 = Supermarket.create!(name: "The Butcher Block", location: "Tucson")
    mark2 = Supermarket.create!(name: "Shop and Save", location: "Vail")

    visit "/supermarkets/#{mark1.id}"

    expect(page).to have_content("The Butcher Block")

    visit "/supermarkets/#{mark2.id}"

    expect(page).to have_content("Shop and Save")
  end

  it " has a link to view all the unique items that a supermarket has" do 
    mark1 = Supermarket.create!(name: "The Butcher Block", location: "Tucson")
  
    cust1 = Customer.create!(name: "Smudger Ruiz", supermarket_id: mark1.id)
    cust2 = Customer.create!(name: "Oliver Williams", supermarket_id: mark1.id)

    cust1.items.create!(name: "steak", price: 20)
    cust1.items.create!(name: "chicken", price: 10)
    cust1.items.create!(name: "salmon", price: 15)

    cust2.items.create!(name: "cereal", price: 6)
    cust2.items.create!(name: "candy", price: 1)
    cust2.items.create!(name: "chicken", price: 10)

    mark2 = Supermarket.create!(name: "Shop and Save", location: "Tucson")
  
    cust3 = Customer.create!(name: "Pupcake Castillo", supermarket_id: mark2.id)
    cust4 = Customer.create!(name: "Chique Mamas", supermarket_id: mark2.id)

    cust3.items.create!(name: "beef", price: 20)
    cust3.items.create!(name: "pork", price: 30)
    cust3.items.create!(name: "lamb", price: 15)

    cust4.items.create!(name: "cookies", price: 6)
    cust4.items.create!(name: "lamb", price: 1)
    cust4.items.create!(name: "cake", price: 10)

    visit "/supermarkets/#{mark1.id}"

    expect(page).to have_link("Supermarkets's Items")
    click_on "Supermarkets's Items"

    expect(current_path).to eq("/supermarkets/#{mark1.id}/items")
    expect(page).to have_content('steak')
    expect(page).to have_content('chicken')
    expect(page).to have_content('salmon')
    expect(page).to have_content('cereal')
    expect(page).to have_content('candy')

    visit "/supermarkets/#{mark2.id}"

    expect(page).to have_link("Supermarkets's Items")
    click_on "Supermarkets's Items"

    expect(current_path).to eq("/supermarkets/#{mark2.id}/items")
    expect(page).to have_content('beef')
    expect(page).to have_content('pork')
    expect(page).to have_content('lamb')
    expect(page).to have_content('cookies')
    expect(page).to have_content('cake')
  end
end
