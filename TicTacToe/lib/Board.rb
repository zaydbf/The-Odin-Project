class Board 
  def initialize
    @grid = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  WINNING_COMBO = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 4, 8], [2, 4, 6], [0, 3, 6],
                    [1, 4, 7], [2, 5, 8]
                  ]

  def display 
    puts ""
    puts "#{@grid[0]} | #{@grid[1]} | #{@grid[2]}"
    puts "---+---+---"
    puts "#{@grid[3]} | #{@grid[4]} | #{@grid[5]}"
    puts "---+---+---"
    puts "#{@grid[6]} | #{@grid[7]} | #{@grid[8]}"
    puts ""
  end

  def valid_move?(position)
    i = position.to_i - 1
    i.between?(0, 8) && @grid[i] != "X" && @grid[i] != "O"
  end

  def update(position, symbol)
    i = position.to_i - 1
    @grid[i] = symbol
  end

  def win?
    WINNING_COMBO.each do |combo|
      if @grid[combo[0]] == @grid[combo[1]] && @grid[combo[1]] == @grid[combo[2]] 
        return true        
      end
    end
    return false
  end

  def tie?
    # .all? checks if every single cell satisfies the condition
    @grid.all? { |cell| cell == "X" || cell == "O" } && !win?
  end

end

=begin This is For Testing

board = Board.new
board.display # Should show 1 to 9

puts "Is move 5 valid? #{board.valid_move?("5")}" # Should be true

board.update("1", "X")
board.update("2", "X")
board.update("3", "X")
board.display # Should show X | X | X on top row

puts "Did X win? #{board.win?}" # Should be true

=end