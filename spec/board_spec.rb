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

  it "returns nil when passed an incorrect coordinate" do
    x = 3
    y = :A
    expect(board.cell(x,y)).to eq nil
    x = 1
    y = :C
    expect(board.cell(x,y)).to eq nil
  end

  it "a portrait ship can be placed within its grid" do
    ship = double :ship, size: 2, portrait?: true
    origin = [2, :B]
    board.place(ship, origin)
    expect(board.cell(2, :B)).to eq ship
    expect(board.cell(2, :A)).to eq ship
    expect(board.cell(1, :A)).to eq :SEA
  end

  it 'a portrait ship will not place if its size puts it outsize the bounds' do
    ship = double :ship, size: 2, portrait?: true
    origin = [2, :A]
    board.place(ship, origin)
    expect(board.cell(2, :A)).to eq :SEA
  end

  it 'a landscape ship can be placed within its grid' do
    ship = double :ship, size:2, portrait?: false
    origin = [1, :A]
    board.place(ship, origin)
    expect(board.cell(1, :A)).to eq ship
    expect(board.cell(2, :A)).to eq ship
    expect(board.cell(1, :B)).to eq :SEA
  end



end
