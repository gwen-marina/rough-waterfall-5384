class Item < ApplicationRecord
  has_many :customer_items
  has_many :customers, through: :customer_items

  validates_presence_of :name
  validates_presence_of :price 
end