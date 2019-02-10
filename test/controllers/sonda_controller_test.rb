require 'test_helper'
require 'sonda_controller'

class SondaControllerTest < ActionDispatch::IntegrationTest
    test "create sonda from request" do
        get "/sonda/start"

        response = JSON.parse(@response.body)
        
        assert_response :success
        assert_equal 1, response["x"]
        assert_equal 1, response["y"]
        assert_equal 1, response["direction"]
    end

    test "move sonda" do
        post "/sonda/move", params: { movimentos: ["M", "M", "GE", "M"] }

        response = JSON.parse(@response.body)

        assert_response :success
        assert_equal 3, response["x"]
        assert_equal 2, response["y"]
        assert_equal 0, response["direction"]
    end

    test "don't move sonda" do
        post "/sonda/move", params: { movimentos: ["GD", "M"] }

        response = JSON.parse(@response.body)

        assert_response :forbidden
        assert_equal 403, response["code"]
    end

    test "returns current position" do
        get "/sonda/current"

        response = JSON.parse(@response.body)

        assert_response :success
    end
end