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
        puts "before: #{@sonda['direction']}"
        if @sonda['direction'] == 0
            @sonda['direction'] = 3
        else
            @sonda['direction'] -= 1
        end
        puts "after: #{@sonda['direction']}"
    end

    def rotate_right
        puts @sonda['direction']
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
        @sonda['y'] += 1
    end

    def move_right
        @sonda['x'] += 1
    end
    
    def move_down
        @sonda['y'] -= 1
    end
    
    def move_left
        @sonda['x'] -= 1
    end
    
end