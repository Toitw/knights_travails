# frozen_string_literal: true

class Board
    attr_accessor :arr
    def initialize
        @arr = [1,2,3,4,5,6,7,8].repeated_permutation(2).to_a
    end
end

class Knight
    attr_accessor :counter, :arr, :initial_position, :actual_position, :final_position, :visited_queue, :coordinate_list

    MOVEMENTS = [[1,2],[2,1],[-1,2],[1,-2],[2,-1],[-2,1],[-1,-2],[-2,-1]]

    def initialize(initial_position, final_position)
        @counter = 0
        @initial_position = initial_position
        @final_position = final_position
        @actual_position = initial_position
        @arr = Board.new
        @coordinate_list = []
        @visited_queue = []
    end

    def get_posible_coordinates
        @coordinate_list = MOVEMENTS.map { |a, b|  [@actual_position[0]-a, @actual_position[1]-b] }
        @coordinate_list.select! {|a,b| a > 0 && a < 9 && b > 0 && b < 9}
        @coordinate_list - @visited_queue
    end

    def choose_path(coordinate_list)
        if @coordinate_list.include?(@final_position)
            @counter += 1
            return
        else
            @counter += 1
            @visited_queue.push(@actual_position)
            @actual_position = @coordinate_list.shift
            @coordinate_list = get_posible_coordinates
            choose_path(@coordinate_list)
        end
    end

    def play
        get_posible_coordinates
        choose_path(@coordinate_list)
    end
end

def knights_travels(initial_position, final_position)
    knight = Knight.new(initial_position, final_position)
    knight.play
    return puts "You can get there in #{knight.counter} moves" if @initial_position == @final_position
end

knights_travels([1,1], [3,8])




