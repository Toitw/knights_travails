# frozen_string_literal: true

class Board
    attr_accessor :arr
    def initialize
        @arr = [1,2,3,4,5,6,7,8].repeated_permutation(2).to_a
    end
end

class Node
    attr_accessor :location, :parent

    def initialize(location, parent)
        @location = location
        @parent = parent
    end
end

class Knight
    attr_accessor :children, :position, :visited_queue, :final_position

    MOVEMENTS = [[1,2],[2,1],[-1,2],[1,-2],[2,-1],[-2,1],[-1,-2],[-2,-1]]

    def initialize(position, final_position)
        @children = []
        @visited_queue = []
        @position = position
        @final_position = final_position
        @queue = []
        @path = []
        @board = Board.new.arr
    end

    def get_posible_coordinates(current_node)
        @children = MOVEMENTS.map { |a, b|  [current_node[0]-a, current_node[1]-b] }
        @children.select! {|a,b| a > 0 && a < 9 && b > 0 && b < 9}
        @children = @children - @visited_queue
    end

    def traverse
        current_node = Node.new(@position, nil)
        @queue.push(current_node.location)
        @visited_queue.push(current_node.location)
        while @queue.empty? == false
            current_node.parent = current_node.location
            current_node.location = @queue.shift
            if current_node.location == @final_position
                puts "llegué"
                return 
            end
            @children = get_posible_coordinates(current_node.location)
            @children.map do |child| 
                if !@visited_queue.include?(child)
                    @visited_queue.push(child)
                    @queue.push(child)
                end
            end
        end
    end

    def play
        traverse
    end
    def check_shortest_path
        if @shortest_path.length == 0 || @path.length < @shortest_path.length
            @shortest_path = @path
        end
        @path = []
        @path.push(@initial_position)
    end
end

def knights_travels(initial_position, final_position)
    knight = Knight.new(initial_position, final_position)
    knight.play
end

knights_travels([1,1], [3,5])




