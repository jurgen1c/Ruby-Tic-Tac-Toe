class Board
  attr_accessor :player1, :player2, :board;
  def initialize(player1 , player2)
    @player1 = player1
    @player2 = player2
    @board = [
      [" "," "," "],
      [" "," "," "],
      [" "," "," "]
    ]
  end
 
  def wincheck(x,y)
    # check line
    return true if @board[x][0] == @board[x][1] && @board[x][0] == @board[x][2]
    # check colon
    return true if @board[0][y] == @board[1][y] && @board[0][y] == @board[2][y]
    #check diagonal
    if x==y
      return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    elsif y == 2-x
      return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
    end
    return false
  end

  def check_coord (lin, col)
    line = { "a"=> 1, "b"=> 2, "c"=> 3 }
    # check if lin is a or b or c
    return false unless lin == "a" || lin == "b" || lin == "c"
    # check if col is 1 or 2 or 3
    return false unless col == "1" || col == "2" || col == "3"
    # if lin and lin are valid check if the field is occupied
    x = line[lin] - 1
    y = col.to_i - 1
    return false unless @board[x][y] == " "
    true
  end

  def restart
    @board = [
      [" "," "," "],
      [" "," "," "],
      [" "," "," "]
    ]
  end
end