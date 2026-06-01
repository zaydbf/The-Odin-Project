require_relative '../lib/Player'

RSpec.describe Player do 
  let(:player) { Player.new("Alice", "X") }
  describe "#initialize" do
    it "Sets the player name and symbol" do
      expect(player.name).to eq("Alice")
      expect(player.symbol).to eq("X")
    end
  end
end