class Board
  attr_accessor :player1, :player2;
  def initialize(player1 , player2)
    @player1 = player1
    @player2 = player2
    @board = [
      [" "," "," "],
      [" "," "," "],
      [" "," "," "]
    ]
  end

  def game_logic
    player_names = ['', '']
    player_names[0] = @player1.name
    player_names[1] = @player2.name
    count_round = 1
    win = false
    turn = rand(0..1)
    puts "\n    1    2    3"
    print "a #{@board[0]}"
    puts
    print "b #{@board[1]}"
    puts
    print "c #{@board[2]}"
    puts
    line = { "a"=> 1, "b"=> 2, "c"=> 3 }
    while (count_round <= 9 && !win)
      puts "#{player_names[turn]}'s turn, please choose from valid table coordinates shown above"
      coord = gets.chomp
      valid = check_coord(coord[0], coord[1])
      while !valid
        puts "Your coordinates are invalid, please choose a valid coordinate"
        coord = gets.chomp
        valid = check_coord(coord[0], coord[1])
      end
      x = line[coord[0]] - 1
      y = coord[1].to_i - 1
      @board[x][y] = turn == 0? @player1.icon : @player2.icon
      win = wincheck(x,y)
      puts "\n    1    2    3"
      print "a #{@board[0]}\n"
      print "b #{@board[1]}\n"
      print "c #{@board[2]}\n"
      break if win

      turn = 1 - turn
      count_round += 1
    end
    if win
      puts "Congratulations #{player_names[turn]} you win!!"
    else
      puts 'This round is a draw'
    end
    puts 'Game Over!'
  end

  private 
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
end