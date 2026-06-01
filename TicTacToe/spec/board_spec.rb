require_relative '../lib/Board'

RSpec.describe Board do 
  let(:board) { Board.new }
  describe "#valid_move?" do 
    it "it should return true for a valid move" do
      expect(board.valid_move?(5)).to be true
    end

    it "it should return false for invalid moves" do
      expect(board.valid_move?("10")).to be false
      expect(board.valid_move?("0")).to be false
      expect(board.valid_move?("invalid")).to be false
    end

    it "it should return false for a spot already taken" do
      board.update("5", "X")
      expect(board.valid_move?("5")).to be false
    end

  end

  describe "#update" do 
    it "it should place to symbol on that spot" do 
      board.update("5", "X")
      expect(board.valid_move?("5")).to be false
    end
  end

  describe "#win" do 
    it "it should return false when board empty" do 
      expect(board.win?).to be false
    end

    it "returns true for a horizontal win" do
      board.update("1", "X")
      board.update("2", "X")
      board.update("3", "X")
      expect(board.win?).to be true

      board.update("4", "X")
      board.update("5", "X")
      board.update("6", "X")
      expect(board.win?).to be true

      board.update("7", "X")
      board.update("8", "X")
      board.update("9", "X")
      expect(board.win?).to be true
    end

    it "returns true for a vertical win" do
      board.update("1", "X")
      board.update("4", "X")
      board.update("7", "X")
      expect(board.win?).to be true

      board.update("2", "X")
      board.update("5", "X")
      board.update("8", "X")
      expect(board.win?).to be true

      board.update("3", "X")
      board.update("6", "X")
      board.update("9", "X")
      expect(board.win?).to be true
    end

    it "returns true for a diagonal win" do
      board.update("1", "O")
      board.update("5", "O")
      board.update("9", "O")
      expect(board.win?).to be true

      board.update("3", "O")
      board.update("5", "O")
      board.update("7", "O")
      expect(board.win?).to be true

    end

  end

  describe "#tie" do 
    it "it returns false when the board is empty" do 
      expect(board.tie?).to be false
    end

    it "it returns true when the board is full with no win" do 
      moves = { "1"=>"X", "2"=>"O", "3"=>"X", "4"=>"X", "5"=>"O", "6"=>"O", "7"=>"O", "8"=>"X", "9"=>"X" }
      moves.each { |pos, sym| board.update(pos, sym) }
      expect(board.tie?).to be true
    end

    it "it returns false when the board is full with a winner" do 
      moves = { "1"=>"X", "2"=>"X", "3"=>"X", "4"=>"O", "5"=>"O", "6"=>"X", "7"=>"O", "8"=>"X", "9"=>"O" }
      moves.each { |pos, sym| board.update(pos, sym) }
      expect(board.tie?).to be false
    end

  end

end