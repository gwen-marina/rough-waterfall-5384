class Customer < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has_many :items, through: :customer_items

  validates_presence_of :name

  def total_price
    items.sum(:price) 
  end
end