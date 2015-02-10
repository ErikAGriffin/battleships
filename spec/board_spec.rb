require 'board'

describe Board do

  let(:board) {Board.new}


  it 'has a grid' do
    expect(board.grid).to_not eq nil
  end

  it 'returns SEA when asked a coordinate' do
    x = 1
    y = :A
    expect(board.cell(x,y)).to eq :SEA
  end

  it "returns out of bounds error when passed an incorrect coordinate" do
    x = 3
    y = :A
    expect{board.cell(x,y)}.to raise_error("Out of bounds")
    x = 1
    y = :C
    expect{board.cell(x,y)}.to raise_error("Out of bounds")
  end

  it "a ship can be placed within its grid" do
    ship = double :ship, size: 2
    x = 2
    y = :B
    board.place(ship, x, y)
    expect(board.cell(x, y)).to eq ship
    expect(board.cell(x, :A)).to eq ship
    expect(board.cell(1, :A)).to eq :SEA
  end


end
