require 'board'

describe Board do

  let(:board) {Board.new}
  let(:ship) {double :ship, size: 2, portrait?: true, sunk?: false, hit: nil}


  # REDO ENTIRE COORDINATE SYSTEM!
  # Somehow, placng aircraft carrier horizontally at C2
  # Had absolutely disasterous results

  it 'has a grid' do
    expect(board.grid).to_not eq nil
  end

  it 'returns SEA when asked a coordinate' do
    coord = [1, :A]
    expect(board.cell(coord)).to eq :SEA
  end

  it "returns nil when passed an incorrect coordinate" do
    coord = [3, :A]
    expect(board.cell(coord)).to eq nil
    coord = [1, :C]
    expect(board.cell(coord)).to eq nil
  end

  it "a portrait ship can be placed within its grid" do
    ship = double :ship, size: 2, portrait?: true
    origin = [2, :B]
    board.place(ship, origin)
    expect(board.cell([2, :B])).to eq ship
    expect(board.cell([2, :A])).to eq ship
    expect(board.cell([1, :A])).to eq :SEA
  end

  it 'a portrait ship will not place if its size puts it outside the bounds' do
    ship = double :ship, size: 2, portrait?: true
    origin = [2, :A]
    board.place(ship, origin)
    expect(board.cell(origin)).to eq :SEA
  end

  it 'a landscape ship can be placed within its grid' do
    ship = double :ship, size:2, portrait?: false
    origin = [1, :A]
    board.place(ship, origin)
    expect(board.cell([1, :A])).to eq ship
    expect(board.cell([2, :A])).to eq ship
    expect(board.cell([1, :B])).to eq :SEA
  end

  it 'a landscape ship will not place if its size puts it outside the bounds' do
    ship = double :ship, size: 2,  portrait?: false
    origin = [2, :B]
    board.place(ship, origin)
    expect(board.cell(origin)).to eq :SEA
  end

  describe 'Mechanics' do

    it 'will process a shot taken, returning :MISS if miss' do
      origin = [1, :A]
      expect(board.shoot(origin)).to eq :MISS
      expect(board.cell(origin)).to eq :SEA
    end

    it 'will process a shot taken, returning :HIT if hit' do
      origin = [1, :B]
      board.place(ship, origin)
      expect(board.shoot(origin)).to eq :HIT
    end

    it 'will change a cell from ship to hit if a ship is hit' do
      origin = [1, :B]
      board.place(ship, origin)
      board.shoot(origin)
      expect(board.cell([1, :A])).to eq ship
      expect(board.cell([2, :A])).to eq :SEA
      expect(board.cell(origin)).to eq :HIT
    end

    it 'will process a shot taken, returning :DUPL if cell has already been hit' do
      origin = [1, :B]
      board.place(ship, origin)
      board.shoot(origin)
      expect(board.shoot(origin)).to eq :DUPL
    end

    it 'will increment hits on any ship that is hit' do

      origin = [1, :B]
      board.place(ship,origin)
      expect(ship).to receive(:hit)
      board.shoot(origin)

    end



  end


end
