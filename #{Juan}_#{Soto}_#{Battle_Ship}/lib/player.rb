class HumanPlayer
    def get_play
        puts "Please make a move. (ex. 0, 0)"
        input = gets.chomp.split(", ")
        input = input.map(&:to_i)
    end
end
