class SondaController < ApplicationController
    $WIDTH = 5.freeze
    $HEIGTH = 5.freeze
    
    def initialize
        create 

        @sonda['x'] = 0
        @sonda['y'] = 0
        @sonda['direction'] = 'D'

        render json: @sonda, status: :ok
    end

    def move
        @sonda['x'] = 0
        @sonda['y'] = 0

        render json: @sonda, status: :ok
    end

    def currentpos

    end

    private 

    def create
        if @sonda.nil?
            @sonda = {}
        end
    end
end