require 'player'

describe 'Player' do

  let(:homeboard) {double :board, place: true}
  let(:targetboard) {double :board}
  let(:player) {Player.new(home_board: homeboard, target_board: targetboard)}
  let(:ship) {double :ship}

  it 'can change a ships orientation, before placement' do
    expect(ship).to receive(:change_orientation)
    player.rotate(ship)
  end

  it 'has its home board' do
    expect(player.home_board).to_not eq nil
  end

  it 'can place ships on home board' do
    origin = [1,:B]
    expect(homeboard).to receive(:place).with(ship, origin).and_return(true)
    player.place(ship, origin)
  end

  it 'has a target board' do

    expect(player.target_board).to_not eq nil


  end



end