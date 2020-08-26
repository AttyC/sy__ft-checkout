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
    @discounted_items = @discounted_items +1 if item.id_number == "001" 

    @items << item.price
  end

  def total(items)
    items.reduce(:+)
  end

  # def total(items)
  #   sum = 0
  #   for i in array do
  #     sum += i
  #   end
  #   sum
  # end

  private

  def apply_discount
  end


end

