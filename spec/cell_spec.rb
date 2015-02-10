require 'cell'

class TestCell; include Cell; end

describe Cell do

  let(:cell) {TestCell.new}
  
  it "has a y coordinate" do
    expect(cell.y).to match(/[A-B]/)
  end

  it "has an x coordinate" do
    expect(cell.x).to be_between(1, 2).inclusive
  end

  # it "has a coordinate" do
  #   expect(cell.coordinate).to eq()
  # end

end