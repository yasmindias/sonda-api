class SondaController < ApplicationController
    before_action :create_sonda, only: [:move, :currentpos]

    $WIDTH = 5.freeze
    $HEIGHT = 5.freeze
    $DIRECTIONS = {"U":0, "R":1, "D":2, "L":3}.freeze

    def start
        $sonda = Hash.new
        $sonda[:x] = 1
        $sonda[:y] = 1
        $sonda[:direction] = $DIRECTIONS[:R]

        render json: $sonda, status: :ok
    end

    def move
        begin 
            service = SondaService.new($sonda, sonda_params)
            $sonda = service.parse_move_array
        rescue => exception
            render json: {"code": Rack::Utils::SYMBOL_TO_STATUS_CODE[:forbidden], "error":exception.to_s}, status: :forbidden
        else
            render json: $sonda, status: :ok
        end
    end

    def currentpos
        render json: $sonda, status: :ok
    end

    private 

    def create_sonda
        if $sonda.nil?
            $sonda = Hash.new
            $sonda[:x] = 1
            $sonda[:y] = 1
            $sonda[:direction] = $DIRECTIONS[:R]
        end
    end

    def sonda_params
        params.require(:movimentos)
    end
end