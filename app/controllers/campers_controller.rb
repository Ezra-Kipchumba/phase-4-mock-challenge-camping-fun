class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serialize: ActivitySerializer
        else
            render json: {error: "Camper not found" }, status: :not_found
        end
    end

    def create
        camper = Camper.create(permitted_params)
        if camper.valid?
            render json: camper,status: :created
        else
            render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    def permitted_params
        params.permit(:name, :age)
    end 
end
