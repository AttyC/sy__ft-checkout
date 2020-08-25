require 'checkout'

describe Checkout do
  it { is_expected.to respond_to(:scan).with(1).argument }

  it 'scan method returns a subtotal' do
    item = Item.new
    subject.scan(item)
    expect(subject.total).to eq 1

  end

end