class SondaController < ApplicationController
    before_action :create_sonda, only: [:move, :currentpos]

    $WIDTH = 5.freeze
    $HEIGTH = 5.freeze
    $DIRECTIONS = {"C":0, "D":1, "B":2, "E":3}.freeze

    def start
        create_sonda
        render json: @sonda, status: :ok
    end

    def move
        service = SondaService.new(@sonda, params[:movimentos])
        @sonda = service.parse_move_array
        render json: @sonda, status: :ok
    end

    def currentpos
        render json: @sonda, status: :ok
    end

    private 

    def create_sonda
        if @sonda.nil?
            @sonda = Hash.new
            @sonda['x'] = 0 
            @sonda['y'] = 0
            @sonda['direction'] = 1
        end
    end
end