require_relative 'item'

class Checkout
  attr_reader :item

  attr_accessor :subtotal
  attr_accessor :discounted_items
  attr_accessor :items

  def initialize
    @items = []
    @discounted_items = 0
  end

  def scan(item)
    @items << item.price
  end

  def total(items)
    items.reduce(:+)
  end
end