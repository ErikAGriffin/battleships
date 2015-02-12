require 'player'

describe 'Player' do

  let(:game) {double :game}
  let(:homeboard) {double :board, place: true}
  let(:targetboard) {double :board}
  let(:player) {Player.new(home_board: homeboard, game: game)}
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

  it 'can shoot at enemy territory if its the players turn' do
    allow(game).to receive(:turn).and_return(player)
    origin = [2,:B]
    expect(game).to receive(:shoot).with(origin)
    player.shoot(origin)
  end

  it "can't shoot at enemy territory if its not the players turn" do
    player2 = double :player
    allow(game).to receive(:turn).and_return(player2)
    origin = [2, :B]
    expect(game).not_to receive(:shoot).with(origin)
    player.shoot(origin)

  end





end
