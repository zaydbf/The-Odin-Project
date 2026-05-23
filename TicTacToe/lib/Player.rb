class Player 
  attr_reader :name, :symbol # This automatically creates the .name and .symbol methods
  
  def initialize(name, symbol)  
    @name = name
    @symbol = symbol
  end
  
end