#!/usr/bin/env ruby


puts 'Welcome to Ruby Tic-Tac-Toe'

# welcome to first player
puts "Welcome Player 1 please input x or o to choose your icon"
player1 = gets.chomp

player2 = player1 =="x"? "o" : "x"
board = [
  [" "," "," "],
  [" "," "," "],
  [" "," "," "]
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

line = { "a"=> 1, "b"=> 2, "c"=> 3 }

def wincheck(board,x,y)
  # check line
  return true if board[x][0] == board[x][1] && board[x][0] == board[x][2]
  # check colon
  return true if board[0][y] == board[1][y] && board[0][y] == board[2][y]
  #check diagonal
  if x==y
    return true if board[0][0] == board[1][1] && board[1][1] == board[2][2]
  elsif y == 2-x
    return true if board[0][2] == board[1][1] && board[1][1] == board[2][0]
  end
  return false
end

while (count_round <= 9 && !win)
  puts "Player #{turn + 1} turn, please choose your coordinates"
  coord = gets.chomp
  x = line[coord[0]] - 1
  y = coord[1].to_i - 1
  board[x][y] = turn == 0? player1 : player2
  win = wincheck(board,x,y)
  if win
    puts "let's go power rangers"
  end
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

puts "Game Over!"