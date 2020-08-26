require 'checkout'

describe Checkout do

  let(:item_1) { double :item, :id_number => "001", :name => "Lavender heart", :price => 9.25 }
  let(:item_2) { double :item, :id_number => "002", :name => "Personalised cufflinks ", :price => 45.00 }
  let(:item_3) { double :item, :id_number => "003", :name => "Lavender heart", :price => 19.95 }

  it { is_expected.to respond_to(:scan).with(1).argument }  

  it 'has a default discounted_items count of 0' do
    expect(subject.discounted_items).to eq 0
  end

  it 'scan method adds item to items array' do
    subject.scan(item_1)
    expect(subject.items.length).to eq 1
  end

  it 'total method returns sum of scanned item prices' do
    subject.scan(item_3)
    subject.scan(item_3)
    expect(subject.total).to eq 39.90
  end

  it 'discounted_items count increases when items with discount are scanned' do
    subject.scan(item_1)
    subject.scan(item_1)
    expect(subject.discounted_items).to eq 2
  end

  it 'apply_discount method applies discount to discounted items when totalling' do
    subject.scan(item_1)
    subject.scan(item_1)
    expect(subject.total).to eq 17.00
  end

  it 'applies 10% off your purchase if subtotal is over £60.00' do
    subject.scan(item_1)
    subject.scan(item_2)
    subject.scan(item_3)
    expect(subject.total).to eq 66.78
  end

  it 'applies 10% off your purchase plus discount for discounted items if subtotal is over £60.00 and 2 or more discounted items are ordered' do
    subject.scan(item_1)
    subject.scan(item_1)
    subject.scan(item_2)
    expect(subject.total).to eq 55.80
  end

end