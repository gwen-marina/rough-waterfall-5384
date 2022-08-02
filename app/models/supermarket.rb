class Supermarket < ApplicationRecord
  has_many :customers

  validates_presence_of :name
  validates_presence_of :location

  def items_list 
    customers.joins(:items).select('items.name').distinct
  end
end