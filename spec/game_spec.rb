require 'game'

describe 'Game' do

  let(:p1board) {double :board}
  let(:p2board) {double :board}
  let(:player1) {double :player, homeboard: p1board}
  let(:player2) {double :player, homeboard: p2board}
  let(:game) {Game.new(players: [player1,player2])}

  let(:origin) {[1,:B]}

  it 'initializes with 2 players' do
    expect(game.player1).to eq player1
    expect(game.player2).to eq player2
  end

  it 'knows whose turn it is' do
    expect(game.turn).to eq player1
  end

  it 'can switch whose turn it is' do
    game.switch_turn
    expect(game.turn).to eq player2
  end

  describe 'Handling Shots' do

    it 'can send a shot to opponents board' do
      game.switch_turn
      expect(game.opponent.homeboard).to receive(:shoot).with(origin)
      game.shoot(origin)
    end

    it "returns 'Cap'n! We missed!!' if the shot returns a :MISS" do
      allow(game.opponent.homeboard).to receive(:shoot).with(origin).and_return(:MISS)
      expect(game.shoot(origin)).to eq "Cap'n! We missed!!"
    end

    it "returns 'DIRECT HIT!! Well done sir!' if the shot returns a :HIT" do
      allow(game.opponent.homeboard).to receive(:shoot).with(origin).and_return(:HIT)
      expect(game.shoot(origin)).to eq "DIRECT HIT!! Well done sir!"
    end

    it "returns 'Blast we wasted that shot. You've already fired on that location!' if the shot returns :DUPL" do
      allow(game.opponent.homeboard).to receive(:shoot).with(origin).and_return(:DUPL)
      expect(game.shoot(origin)).to eq "Blast we wasted that shot. You've already fired on that location!"

    end

  end








end
