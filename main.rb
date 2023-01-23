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
    attr_accessor :children, :position, :visited_queue, :final_position, :path

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
    #First add to children the posible future locations, then filter the not valid and finally create
    #a node for each position so I can store its parent
    def get_posible_coordinates(current_node)
        @children = MOVEMENTS.map { |a, b|  [current_node.location[0]-a, current_node.location[1]-b] }
        @children.select! {|a,b| a > 0 && a < 9 && b > 0 && b < 9}
        @children = @children - @visited_queue
        @children.map { |position| Node.new(position, current_node)}
    end
    #Breadth first algorithm for graphs
    def traverse
        current_node = Node.new(@position, nil)
        @queue.push(current_node)
        @visited_queue.push(current_node)
        while @queue.empty? == false
            current_node = @queue.shift
            if current_node.location == @final_position
                print_path(current_node)
                @path.push(current_node.location)
                puts "My path #{@path} in #{@path.length} moves"
                return 
            end
            @children = get_posible_coordinates(current_node)
            
            @children.map do |child| 
                if !@visited_queue.include?(child)
                    @visited_queue.push(child)
                    @queue.push(child)
                end
            end
        end
    end

    def print_path(node)
        return if node.parent == nil
        @path.unshift(node.parent.location)
        node = node.parent
        print_path(node)
    end

    def play
        traverse
    end

def knights_travels(initial_position, final_position)
    knight = Knight.new(initial_position, final_position)
    knight.play
end

knights_travels([1,1], [8,8])




