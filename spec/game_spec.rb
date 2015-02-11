require 'game'

describe 'Game' do

  let(:game) {Game.new}

  it 'initializes with 2 players' do
    expect(game.player1).to_not eq nil
    expect(game.player2).to_not eq nil
  end

  it "initializes with all the game's ships" do
    expect(game.p1_ships.count).to eq 5
    expect(game.p2_ships.count).to eq 5
  end

  it 'starts by player 1 placing their ships' do
    # Shouldn't both players place ships at the same time?
    # What is that.. multithreading? Is our game online?

  end


end