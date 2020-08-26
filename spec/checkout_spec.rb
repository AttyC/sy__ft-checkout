require 'checkout'

describe Checkout do
  it { is_expected.to respond_to(:scan).with(1).argument }

  it 'scan method adds item to items array' do
    item = Item.new("Lavender heart","001", 9.25 )
    subject.scan(item)
    expect(subject.items.length).to eq 1
  end

  it 'has a default discounted_items count of 0' do
    expect(subject.discounted_items).to eq 0
  end
end