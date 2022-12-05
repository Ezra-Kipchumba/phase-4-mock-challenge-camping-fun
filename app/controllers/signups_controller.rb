class SignupsController < ApplicationController
    
    def create
        signup = Signup.create(permitted_params)
        if signup.valid?
            render json: signup, status: :created
        else
            render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    def permitted_params
        params.permit(:camper_id, :activity_id, :time)
    end 

end
