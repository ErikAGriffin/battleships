require 'cell'

class TestCell; include Cell; end

describe Cell do

  let(:cell) {TestCell.new}
  
  it "has a y coordinate" do
    expect(cell.y).to be_between(0, 1).inclusive
  end

  it "has an x coordinate" do
    expect(cell.x).to be_between(0, 1).inclusive
  end

  it "has a coordinate" do
    expect(cell.coordinate).to eq([0, 0])
  end

end