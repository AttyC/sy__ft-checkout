require_relative 'item'

class Checkout
attr_reader :item
attr_accessor :total

  def scan(item)
    @total = 1
  end
end