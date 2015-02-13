require 'player'

describe 'Player' do

  # I believe I will remove all player shooting tests

  let(:homeboard) {double :board, place: true}
  let(:player) {Player.new(homeboard: homeboard)}
  let(:ship) {double :ship}

  it 'has its home board' do
    expect(player.homeboard).to eq homeboard
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




end
