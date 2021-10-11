class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize()
        @board = [" "," "," ", " "," "," ", " "," "," "]
    end

    def display_board()
        puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
        puts("-----------")
        puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
        puts("-----------")
        puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
    end

    def input_to_index(i)
        return i.to_i() - 1
    end

    def move(i, ch)
        @board[i] = ch
    end

    def position_taken?(index)
        return false if( @board[index] == " " )
        return true
    end
    
    def valid_move?(i)
        return false if( i > 9 || i < 0 )
        return !position_taken?(i)
    end

    def turn_count()
        count = 0
        for el in @board
            count += 1 if( el != " ")
        end

        return count
    end

    def current_player()
        return 'O' if ( turn_count() % 2 != 0)
        return 'X'
    end

    def turn()
        pos = input_to_index( gets() )
        
        if( !valid_move?( pos ) )
            pos = input_to_index( gets() )
        end

        move(pos, current_player())
        display_board()
    end

    def won?()
        for el in WIN_COMBINATIONS
            if( @board[ el[0] ] == 'X' && @board[ el[1] ] == 'X' && @board[ el[2] ] == 'X' ||
                @board[ el[0] ] == 'O' && @board[ el[1] ] == 'O' && @board[ el[2] ] == 'O' )
                return el
            end
        end
        return false
    end
    
    def full?()
        return turn_count() == 9
    end

    def over?()
        if( full?() )
            return true
        elsif( won?() )
            return true
        end
        return false
    end

    def winner()
        for el in WIN_COMBINATIONS
            if( @board[ el[0] ] == 'X' && @board[ el[1] ] == 'X' && @board[ el[2] ] == 'X' )
                return 'X'
            elsif( @board[ el[0] ] == 'O' && @board[ el[1] ] == 'O' && @board[ el[2] ] == 'O' )
                return 'O'
            end
        end
        return nil
    end

    def draw?()
        if( won?() )
            return false
        elsif( !full?() )
            return false
        end
        return true
    end

    def play()
        for el in 0..9
            if( won?() )
                break
            end
            if( !full?() )
                turn()
            end
            
            over?()
            draw?()
        end
        if( won?() )
            puts("Congratulations #{winner()}!")
        else
            puts("Cat's Game!")
        end
    end
end