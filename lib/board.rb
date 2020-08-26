# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity

class Board
  attr_accessor :player1, :player2, :board
  def initialize(player1 , player2)
    @player1 = player1
    @player2 = player2
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def wincheck(lin, col)
    # check line
    return true if @board[lin][0] == @board[lin][1] && @board[lin][0] == @board[lin][2]

    # check colon
    return true if @board[0][col] == @board[1][col] && @board[0][col] == @board[2][col]

    # check diagonal
    if lin == col
      return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]

    elsif col == 2 - lin
      return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]

    end
    false
  end

  def check_coord(lin, col)
    line = { 'a' => 1, 'b' => 2, 'c' => 3 }
    # check if lin is a or b or c
    return false unless %w[a b c].include?(lin)

    # check if col is 1 or 2 or 3
    return false unless %w[1 2 3].include?(col)

    # if lin and lin are valid check if the field is occupied
    x = line[lin] - 1
    y = col.to_i - 1
    return false unless @board[x][y] == ' '
    true
  end

  def restart
    @board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end
end

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
