require 'game'

describe 'Game' do

  let(:player1) {double :player}
  let(:player2) {double :player}
  let(:game) {Game.new(players: [player1,player2])}

  it 'initializes with 2 players' do
    expect(game.player1).to_not eq nil
    expect(game.player2).to_not eq nil
  end

  it 'knows whose turn it is' do
    expect(game.turn).to eq game.player1
  end

  it 'should receive shots from the player whose turn it is' do

  end







end
