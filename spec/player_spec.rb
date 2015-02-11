require 'player'

describe 'Player' do

  let(:homeboard) {double :board, place: true}
  let(:targetboard) {double :board}
  let(:player) {Player.new(home_board: homeboard)}
  let(:ship) {double :ship}

  it 'has its home board' do
    expect(player.home_board).to eq homeboard
  end

  it 'can change a ships orientation, before placement' do
    expect(ship).to receive(:change_orientation)
    player.rotate(ship)
  end

  it 'can place ships on home board' do
    origin = [1,:B]
    expect(homeboard).to receive(:place).with(ship, origin).and_return(true)
    player.place(ship, origin)
  end

  it 'can shoot at enemy territory' do
    origin = [2,:B]
    expect(player).to receive(:shoot).with(origin)
    player.shoot(origin)
  end





end