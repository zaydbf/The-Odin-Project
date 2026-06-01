require_relative "../lib/Game"

RSpec.describe Game do 
  let(:game) { Game.new("Zayd", "Bob")}
  describe "#take_turn" do
    it "shows an error until a valid move is given" do 
      allow(game).to receive(:gets).and_return("11\n", "5\n")
      expect { game.take_turn }.to output(/Invalid move!/).to_stdout
    end
  end

  describe "#switch_player" do
    it "it should switch between player1 and player2 & inverse" do 
      game.switch_player
      expect(game.currentplayer).to eq(game.player2)
      
      game.switch_player
      expect(game.currentplayer).to eq(game.player1)
    end
  end

  describe "#play" do 
    it "runs through a winning game for player 1" do 
      allow(game).to receive(:gets).and_return("2\n", "1\n", "5\n", "3\n", "8\n")
      expect { game.play }.to output(/Congrats ! Zayd You Won/).to_stdout
    end
    it "runs through a winning game for player 2" do 
      allow(game).to receive(:gets).and_return("1\n", "2\n", "3\n", "5\n", "7\n", "8\n")
      expect { game.play }.to output(/Congrats ! Bob You Won/).to_stdout
    end
    it "runs through a tie game" do
      allow(game).to receive(:gets).and_return("1\n", "2\n", "3\n", "5\n", "4\n", "6\n", "8\n", "7\n", "9\n")
      expect { game.play }.to output(/It's a tie !/).to_stdout
    end

  end

end