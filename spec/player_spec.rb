require 'player'

describe 'Player' do

  let(:player) {Player.new}

  let(:ship) {double :ship}

  it 'can change a ships orientation, before placement' do
    expect(ship).to receive(:change_orientation)
    player.rotate(ship)
  end

  it 'has its home board' do
    expect(player.home_board).to_not eq nil
  end



end