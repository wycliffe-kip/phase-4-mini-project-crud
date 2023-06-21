class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end 

    def create 
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else 
            render json: {error: "Could not create spice"}, status: :not_found
        end 
    end 

    def update 
        spice = Spice.find(params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else 
            render json: {error: "Could not update spice"}, status: :not_found
        end 
    end 

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy 
        head :no_content
    end 

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end 
end
