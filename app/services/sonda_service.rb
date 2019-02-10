class SondaService
    def initialize(sonda, move_array)
        @sonda = sonda
        @move_array = move_array
    end

    def parse_move_array
        @move_array.each do |el|
            if el == "GE"
                rotate_left
            elsif el == "GD"
                rotate_right
            else 
                move_sonda
            end
        end
        @sonda
    end

    def rotate_left
        if @sonda[:direction] <= $DIRECTIONS[:U]
            @sonda[:direction] = $DIRECTIONS[:L]
        else
            @sonda[:direction] -= 1
        end
    end

    def rotate_right
        if @sonda[:direction] >= $DIRECTIONS[:L]
            @sonda[:direction] = $DIRECTIONS[:U]
        else
            @sonda[:direction] += 1
        end
    end

    def move_sonda
        if @sonda[:direction] == $DIRECTIONS[:U]
            move_up
        elsif @sonda[:direction] == $DIRECTIONS[:R]
            move_right
        elsif @sonda[:direction] == $DIRECTIONS[:D]
            move_down
        elsif @sonda[:direction] == $DIRECTIONS[:L]
            move_left
        end
    end

    def move_up
        if @sonda[:y]+1 > $HEIGHT 
            raise StandardError, "Can't go up, out of bounds!" 
        else 
            @sonda[:y] += 1
        end
    end

    def move_right
        if @sonda[:x]+1 > $WIDTH
            raise StandardError, "Can't go right, out of bounds!" 
        else
            @sonda[:x] += 1
        end
    end
    
    def move_down
        if @sonda[:y]-1 <= 0
            raise StandardError, "Can't go down, out of bounds!" 
        else
            @sonda[:y] -= 1
        end
    end
    
    def move_left
        if @sonda[:x]-1 <= 0
            raise StandardError, "Can't go left, out of bounds!" 
        else
            @sonda[:x] -= 1
        end
    end

    def getSonda
        @sonda
    end
end