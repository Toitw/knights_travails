# frozen_string_literal: true

class Board
    attr_accessor :arr
    def initialize
        @arr = [1,2,3,4,5,6,7,8].repeated_permutation(2).to_a
    end
end

class Knight
    attr_accessor :counter, :arr, :initial_position, :actual_position, :final_position, :visited_queue, :coordinate_list, :counter_list, :path, :shortest_path

    MOVEMENTS = [[1,2],[2,1],[-1,2],[1,-2],[2,-1],[-2,1],[-1,-2],[-2,-1]]

    def initialize(initial_position, final_position)
        @counter = 0
        @counter_list = []
        @initial_position = initial_position
        @final_position = final_position
        @actual_position = initial_position
        @arr = Board.new
        @coordinate_list = []
        @visited_queue = []
        @path = []
        @shortest_path = []
    end

    def get_posible_coordinates
        @coordinate_list = MOVEMENTS.map { |a, b|  [@actual_position[0]-a, @actual_position[1]-b] }
        @coordinate_list.select! {|a,b| a > 0 && a < 9 && b > 0 && b < 9}
        @coordinate_list - @visited_queue
    end

    def choose_path(coordinate_list)
        @coordinate_list.map do |coordinate|
            if @coordinate_list.include?(@final_position)
                @path.push(@actual_position, @final_position)
                @counter += 1
            else
                @path.push(@actual_position)
                @counter += 1
                @visited_queue.push(@actual_position)
                @actual_position = coordinate
                @coordinate_list = get_posible_coordinates
                choose_path(@coordinate_list)
            end
            @counter_list.push(@counter)
            @counter = 0
            save_shortest_path
        end
    end

    def save_shortest_path
        if @shortest_path.length == 0
            @shortest_path = @path
        elsif @path.length < @shortest_path.length
            @shortest_path = @path
        end 
        @path = []
    end

    def return_shortest_count
        @shortest_count = @counter_list.min.to_i
    end

    def play
        get_posible_coordinates
        choose_path(@coordinate_list)
    end

    def play_loop

        
    end
end

def knights_travels(initial_position, final_position)
    knight = Knight.new(initial_position, final_position)
    knight.play
    return puts "You can get there in #{knight.return_shortest_count} moves, you path was #{knight.shortest_path}" if @initial_position == @final_position
end

knights_travels([1,1], [3,5])




