
class CarparkController < ApplicationController

    def nearest
        latitude = params[:latitude]
        longitude = params[:longitude]
        page = params[:page]
        per_page = params[:per_page]


    end


private
def carpark_params
    params.require(:carpark).permit(:latitude, :longitude)
end


end