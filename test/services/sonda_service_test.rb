require 'test_helper'
require 'sonda_service'

class SondaServiceTest < ActiveSupport::TestCase
    setup do
        @sonda = Hash.new
        
        $HEIGHT = 5
        $WIDTH = 5
        $DIRECTIONS = {"U":0, "R":1, "D":2, "L":3}.freeze
    end

    test "rotate sonda to left" do
        @sonda[:direction] = 0
        
        service = SondaService.new(@sonda, nil)
        service.rotate_left

        assert_equal 3, service.getSonda[:direction]
    end

    test "rotate sonda to right" do
        @sonda[:direction] = 0
        
        service = SondaService.new(@sonda, nil)
        service.rotate_right

        assert_equal 1, service.getSonda[:direction]
    end

    test "move sonda up" do
        @sonda[:x] = 1
        @sonda[:y] = 1
        @sonda[:direction] = 1

        service = SondaService.new(@sonda, nil)
        service.move_up
        
        assert_equal 2, service.getSonda[:y]
    end

    test "don't move sonda up" do
        @sonda[:x] = 1
        @sonda[:y] = 5
        @sonda[:direction] = 0

        service = SondaService.new(@sonda, nil)

        assert_raise StandardError  do 
            service.move_up
        end
    end

    test "move sonda right" do
        @sonda[:x] = 1
        @sonda[:y] = 1
        @sonda[:direction] = 1

        service = SondaService.new(@sonda, nil)
        service.move_right
        
        assert_equal 2, service.getSonda[:x]
    end

    test "don't move sonda right" do
        @sonda[:x] = 5
        @sonda[:y] = 1
        @sonda[:direction] = 1

        service = SondaService.new(@sonda, nil)

        assert_raise StandardError  do 
            service.move_right
        end
    end

    test "move sonda down" do
        @sonda[:x] = 5
        @sonda[:y] = 5
        @sonda[:direction] = 2

        service = SondaService.new(@sonda, nil)
        service.move_down
        
        assert_equal 4, service.getSonda[:y]
    end

    test "don't move sonda down" do
        @sonda[:x] = 1
        @sonda[:y] = 1
        @sonda[:direction] = 2

        service = SondaService.new(@sonda, nil)

        assert_raise StandardError  do 
            service.move_down
        end
    end

    test "move sonda left" do
        @sonda[:x] = 3
        @sonda[:y] = 3
        @sonda[:direction] = 3

        service = SondaService.new(@sonda, nil)
        service.move_left
        
        assert_equal 2, service.getSonda[:x]
    end

    test "don't move sonda left" do
        @sonda[:x] = 1
        @sonda[:y] = 1
        @sonda[:direction] = 3

        service = SondaService.new(@sonda, nil)

        assert_raise StandardError  do 
            service.move_left
        end
    end
end