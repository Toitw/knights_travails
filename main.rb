# frozen_string_literal: true

class Board
    attr_accessor :arr
    def initialize
        @arr = [1,2,3,4,5,6,7,8].repeated_permutation(2).to_a
    end
end

class Knight
    attr_accessor :counter, :arr, :initial_position, :actual_position, :final_position

    MOVEMENTS = [[1,2],[2,1],[-1,2],[1,-2],[2,-1],[-2,1],[-1,-2],[-2,-1]]

    def initialize(initial_position, final_position)
        @counter = 0
        @initial_position = initial_position
        @final_position = final_position
        @actual_position = initial_position
        @arr = Board.new
    end

    def get_posible_coordinates
        coordinate_list = MOVEMENTS.map { |a, b|  [@initial_position[0]-a, @initial_position[1]-b] }
        coordinate_list.select! {|a,b| a > 0 && a < 9 && b > 0 && b < 9}
        p coordinate_list
    end
end

def knights_travels(initial_position, final_position)
    knight = Knight.new(initial_position, final_position)
    knight.get_posible_coordinates
    return puts "You can get there in #{knight.counter} moves" if initial_position == final_position

end

knights_travels([1,1], [2,3])




