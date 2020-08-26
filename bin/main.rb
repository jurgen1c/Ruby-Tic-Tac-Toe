#!/usr/bin/env ruby
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

puts 'Welcome to Ruby Tic-Tac-Toe'

# welcome to first player
puts 'Welcome Player 1 please input x or o to choose your icon'
player1 = gets.chomp

player2 = player1 == 'x' ? 'o' : 'x'
board = [
  [' ', ' ', ' '],
  [' ', ' ', ' '],
  [' ', ' ', ' ']
]

puts "Player 1 is #{player1} and Player 2 is #{player2}"
puts
puts "\n    1    2    3"
print "a #{board[0]}"
puts
print "b #{board[1]}"
puts
print "c #{board[2]}"
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

while count_round <= 9 && !win
  puts "Player #{turn + 1} turn, please choose your coordinates"
  coord = gets.chomp
  x = line[coord[0]] - 1
  y = coord[1].to_i - 1
  board[x][y] = turn.zero? ? player1 : player2
  win = wincheck(board, x, y)
  turn = 1 - turn
  count_round += 1
  puts "\n    1    2    3"
  print "a #{board[0]}"
  puts
  print "b #{board[1]}"
  puts
  print "c #{board[2]}"
  puts
end

puts 'Game Over!'
