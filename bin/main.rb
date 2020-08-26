#!/usr/bin/env ruby
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity
player_names = ['', '']
puts 'Welcome to Ruby Tic-Tac-Toe'

# welcome to first player
puts 'Welcome player 1 please intro your name below'
player_names[0] = gets.chomp
puts 'Please input x or o to choose your icon'
player1 = gets.chomp

puts 'Welcome player 2 please intro your name below'
player_names[1] = gets.chomp

player2 = player1 == 'x' ? 'o' : 'x'
board = [
  [' ', ' ', ' '],
  [' ', ' ', ' '],
  [' ', ' ', ' ']
]

puts "#{player_names[0]} is #{player1} and #{player_names[1]} is #{player2}"
puts

count_round = 1
win = false
turn = rand(0..1)

line = { 'a' => 1, 'b' => 2, 'c' => 3 }

def wincheck(board, lin, col)
  return true if board[lin][0] == board[lin][1] && board[lin][0] == board[lin][2]

  return true if board[0][col] == board[1][col] && board[0][col] == board[2][col]

  if lin == col
    return true if board[0][0] == board[1][1] && board[1][1] == board[2][2]
  elsif col == 2 - lin
    return true if board[0][2] == board[1][1] && board[1][1] == board[2][0]
  end
  false
end

def check_coord(board, lin, col)
  line = { 'a' => 1, 'b' => 2, 'c' => 3 }
  # check if lin is a or b or c
  return false unless ['a', 'b', 'c'].include?(lin)

  # check if col is 1 or 2 or 3
  return false unless ['1', '2', '3'].include?(col)

  # if lin and lin are valid check if the field is occupied
  x = line[lin] - 1
  y = col.to_i - 1
  return false unless board[x][y] == ' '

  true
end

puts "\n    1    2    3"
print "a #{board[0]}"
puts
print "b #{board[1]}"
puts
print "c #{board[2]}"
puts

while count_round <= 9 && !win
  # table displayed above shows player available moves
  puts "#{player_names[turn]}'s turn, please choose from valid table coordinates shown above"
  coord = gets.chomp
  valid = check_coord(board, coord[0], coord[1])
  until valid
    puts 'Your coordinates are invalid, please choose a valid coordinate'
    coord = gets.chomp
    valid = check_coord(board, coord[0], coord[1])
  end
  x = line[coord[0]] - 1
  y = coord[1].to_i - 1
  board[x][y] = turn.zero? ? player1 : player2
  win = wincheck(board, x, y)
  puts "\n    1    2    3"
  print "a #{board[0]}"
  puts
  print "b #{board[1]}"
  puts
  print "c #{board[2]}"
  puts
  break if win

  turn = 1 - turn
  count_round += 1
end

if win
  puts "Congratulations #{player_names[turn]} you win!!"
else
  puts 'This round is a draw'
end
puts 'Game Over!' # An if statement will be added to check which player is the winner

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
