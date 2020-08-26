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
    # @subtotal = 1
    @items << item
  end
end