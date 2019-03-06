require 'test_helper'

class SondaControllerTest < ActionDispatch::IntegrationTest
    def setup
        $sonda = Hash.new
        $sonda[:x] = 1
        $sonda[:y] = 1
        $sonda[:direction] = 1
    end

    test "create sonda from request" do
        get "/sonda/start"

        response = JSON.parse(@response.body)
        
        assert_response :success
        assert_equal 1, response["x"]
        assert_equal 1, response["y"]
        assert_equal 1, response["direction"]
    end

    test "move sonda" do
        post "/sonda/move", params: { movements: ["M", "M", "TL", "M"] }

        response = JSON.parse(@response.body)

        assert_response :success
        assert_equal 3, response["x"]
        assert_equal 2, response["y"]
        assert_equal 0, response["direction"]
    end

    test "don't move sonda" do
        post "/sonda/move", params: { movements: ["TR", "M"] }

        response = JSON.parse(@response.body)

        assert_response :forbidden
        assert_equal 403, response["code"]
    end

    test "returns current position" do
        get "/sonda/current"

        response = JSON.parse(@response.body)

        assert_response :success
        assert_equal 1, response["x"]
        assert_equal 1, response["y"]
        assert_equal 1, response["direction"]
    end
end