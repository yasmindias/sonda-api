class SondaController < ApplicationController
    before_action :create_sonda, only: [:move, :currentpos]

    $WIDTH = 5.freeze
    $HEIGHT = 5.freeze
    $DIRECTIONS = {"C":0, "D":1, "B":2, "E":3}.freeze

    def start
        $sonda = Hash.new
        $sonda['x'] = 0 
        $sonda['y'] = 0
        $sonda['direction'] = 1

        render json: $sonda, status: :ok
    end

    def move
        begin 
            service = SondaService.new($sonda, sonda_params)
            $sonda = service.parse_move_array
        rescue => exception
            render json: {"error":exception.to_s}, status: :unprocessable_entity
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
            $sonda['x'] = 0 
            $sonda['y'] = 0
            $sonda['direction'] = 1
        end
    end

    def sonda_params
        params.require(:movimentos)
    end
end