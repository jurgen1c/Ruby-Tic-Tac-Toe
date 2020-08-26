#!/usr/bin/env ruby
require './lib/board.rb'
require './lib/player.rb'

puts 'Welcome to Ruby Tic-Tac-Toe'

# welcome to first player
puts "Welcome Player 1 please input your name"

player1 = Player.new(gets.chomp)
puts "Please type x or o to choose side"
player1.icon = gets.chomp

puts "welcome player 2 please input your name"
player2 = Player.new(gets.chomp)

player2.icon = player1.icon =="x"? "o" : "x"
puts "\nPlayer 1 is #{player1.name} #{player1.icon} and Player 2 is #{player2.name} #{player2.icon}"
puts

count_round = 1
win = false
turn = rand(0..1)

board = Board.new(player1 , player2)

puts "#{board.player1.name}  #{board.player2.name}"

#board.game_logic

puts "Game Over!"