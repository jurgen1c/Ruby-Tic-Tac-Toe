class Board
    def initialize()
        @board = [
                [" "," "," "],
                [" "," "," "],
                [" "," "," "]
            ]
    end

    def game_logic
        wincheck()
        while (count_round <= 9 && !win)
            puts "Player #{turn + 1} turn, please choose your coordinates"
            coord = gets.chomp
            x = coord[0]
            valid = x == "a" || x == "b" || x == "c"
            puts " Zordon" if !valid
            x = line[coord[0]] - 1 if valid
            y = coord[1].to_i - 1
            valid = board[x][y] == " "
            while !valid
              puts "Please choose a valid coordinate"
              coord = gets.chomp
              x = line[coord[0] ] - 1
              y = coord[1].to_i - 1
              valid = x == "a" || x == "b" || x == "c"
              next if !valid
              valid = board[x][y] == " "
            end
            board[x][y] = turn == 0? player1 : player2
            win = wincheck(board,x,y)
            if win
              puts "let's go power rangers"
            end
            turn = 1 - turn
            count_round += 1
            puts "\n"
            print board[0]
            puts 
            print board[1]
            puts
            print board[2]
            puts
          end
    end

    private def wincheck(board,x,y)
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
end