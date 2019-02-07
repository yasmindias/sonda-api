require 'test_helper'
require 'sonda_service'

class SondaServiceTest < ActiveSupport::TestCase
    setup do
        @sonda = Hash.new
    end

    test "rotate sonda to left" do
        @sonda['direction'] = 0
        
        service = SondaService.new(@sonda, nil)
        service.rotate_left

        assert_equal 3, service.getSonda['direction']
    end

    test "rotate sonda to right" do
        @sonda['direction'] = 0
        
        service = SondaService.new(@sonda, nil)
        service.rotate_right

        assert_equal 1, service.getSonda['direction']
    end
end