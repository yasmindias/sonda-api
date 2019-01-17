class SondaService
    def initialize(sonda, move_array)
        @sonda = sonda
        @move_array = move_array
    end

    def parse_move_array
        @move_array.each do |el.upcase!|
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
        if @sonda['direction'] == 0
            @sonda['direction'] = 3
        else
            @sonda['direction'] -= 1
        end
    end

    def rotate_right
        if @sonda['direction'] == 3
            @sonda['direction'] = 0
        else
            @sonda['direction'] += 1
        end
    end

    def move_sonda
        if @sonda['direction'] == 0 #C
            move_up
        elsif @sonda['direction'] == 1 #D
            move_right
        elsif @sonda['direction'] == 2 #B
            move_down
        elsif @sonda['direction'] == 3 #E
            move_left
        end
    end

    def move_up
        raise "Can't go up, out of bounds!" if @sonda['y']+1 > $HEIGHT
        @sonda['y'] += 1
    end

    def move_right
        raise "Can't go right, out of bounds!" if @sonda['x']+1 > $WIDTH
        @sonda['x'] += 1
    end
    
    def move_down
        raise "Can't go down, out of bounds!" if @sonda['y']-1 <= 0
        @sonda['y'] -= 1
    end
    
    def move_left
        raise "Can't go left, out of bounds!" if @sonda['x']-1 <= 0
        @sonda['x'] -= 1
    end
end