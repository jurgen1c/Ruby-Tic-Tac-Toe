#!/usr/bin/env ruby

require './lib/board.rb'
require './lib/player.rb'

puts 'Welcome to Ruby Tic-Tac-Toe'

puts 'Welcome Player 1 please input your name'
name = gets.chomp
while name.empty?
  puts 'Please type in a valid name'
  name = gets.chomp
end

player1 = Player.new(name)
puts 'Please type x or o to choose side'

icon = gets.chomp
until %w[x o].include?(icon)
  puts 'Please type in a valid icon'
  icon = gets.chomp
end

player1.icon = icon

puts 'welcome player 2 please input your name'
name = gets.chomp
while name.empty?
  puts 'Please type in a valid name'
  name = gets.chomp
end
player2 = Player.new(name)

player2.icon = player1.icon == 'x' ? 'o' : 'x'
puts "\nPlayer 1 is #{player1.name} #{player1.icon} and Player 2 is #{player2.name} #{player2.icon}"

game_board = Board.new(player1, player2)

player_names = ['', '']
player_names[0] = player1.name
player_names[1] = player2.name

finish = false
until finish
  count_round = 1
  win = false
  turn = rand(0..1)
  puts "\n    1    2    3"
  print "a #{game_board.board[0]}"
  puts
  print "b #{game_board.board[1]}"
  puts
  print "c #{game_board.board[2]}"
  puts
  line = { 'a' => 1, 'b' => 2, 'c' => 3 }
  while count_round <= 9 && !win
    puts "#{player_names[turn]}'s turn, please choose from valid table coordinates shown above"
    coord = gets.chomp
    valid = game_board.check_coord(coord[0], coord[1])
    until valid
      puts 'Your coordinates are invalid, please choose a valid coordinate'
      coord = gets.chomp
      valid = game_board.check_coord(coord[0], coord[1])
    end
    x = line[coord[0]] - 1
    y = coord[1].to_i - 1
    game_board.board[x][y] = turn.zero? ? player1.icon : player2.icon
    win = game_board.wincheck(x, y)
    puts "\n    1    2    3"
    print "a #{game_board.board[0]}\n"
    print "b #{game_board.board[1]}\n"
    print "c #{game_board.board[2]}\n"
    break if win

    turn = 1 - turn
    count_round += 1
  end
  if win
    puts "Congratulations #{player_names[turn]} you win!!"
  else
    puts 'This round is a draw'
  end

  puts 'Would you like to play again? (y/n)'
  answer = gets.chomp
  finish = answer != 'y'

  game_board.restart unless finish

end

puts 'Game Over, Thanks for playing our game (:D)'
