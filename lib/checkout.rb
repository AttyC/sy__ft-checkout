require_relative 'item'

class Checkout
  attr_reader :item

  attr_accessor :subtotal
  attr_accessor :discounted_items
  attr_accessor :items

  OVERALL_DISCOUNT_MINIMUM = 60.00
  DISCOUNT_ID_NUMBER = "001"

  def initialize
    @items = []
    @discounted_items = 0
  end

  def scan(item)
    @discounted_items = @discounted_items +1 if item.id_number == DISCOUNT_ID_NUMBER 
    @items << item.price
  end

  def total
    @subtotal = items.reduce(:+)
    puts @subtotal
    promotional_rules(discounted_items, subtotal)
  end


  private

  def promotional_rules(discounted_items, subtotal)
    discounted_items.times { @subtotal = @subtotal - 0.75} if @discounted_items > 1
    ten_percent(subtotal) if @subtotal >  OVERALL_DISCOUNT_MINIMUM
    @subtotal
  end

  def ten_percent(subtotal)
    @subtotal = (@subtotal - @subtotal * 0.1).round(2)
  end

end

