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






end
