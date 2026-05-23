require_relative 'Board'
require_relative 'Player'

class Game 
  
  def initialize(player1, player2)
    @board = Board.new
    @player1 = Player.new(player1, "X")
    @player2 = Player.new(player2, "O")
    @currentplayer = @player1
  end

  def take_turn
    loop do 
      puts "#{@currentplayer.name} (#{@currentplayer.symbol}) choose a spot (1-9)"
      choice = gets.chomp
      if @board.valid_move?(choice)
        @board.update(choice, @currentplayer.symbol)
        break
      else
        puts "Invalid move!"  
      end
    end
  end

  def switch_player
    if @currentplayer == @player1
      @currentplayer = @player2
    else
      @currentplayer = @player1  
    end
  end

  def play 
    puts "Welcome to Tic-Tac-Toe!"

    until @board.win? || @board.tie?
      @board.display
      take_turn
      switch_player unless @board.win? || @board.tie?
    end  

    @board.display
    if @board.win?
      puts "Congrats ! #{@currentplayer.name} You Won" 
    else
      puts "It's a tie !"  
    end

  end

end