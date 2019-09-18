require 'haversine'
require 'will_paginate/array'
class CarparkController < ApplicationController
    before_action :check_carpark_params , :save_params , :grab_all_available_carparks
    def show
        render json: @new_list.paginate(:page => params[:page], :per_page => params[:per_page ]).as_json(except:[:id,:haversine_value, :car_park_no])
    end


private
def grab_all_available_carparks
    @carpark_list = Carpark.where("available_lots").find_each(:batch_size => 9999)
    @new_list = Array.new
    @carpark_list.each do |carpark|
        carpark_location = [carpark.longitude,carpark.latitude]
        carpark.haversine_value = Haversine.distance(params[:latitude].to_f,params[:longitude].to_f, carpark.latitude,carpark.longitude ).to_meters
        @new_list<<carpark
    end
    @new_list.sort_by! { |carpark|  carpark.haversine_value }
    @new_list.each do |carpark|
        p carpark.haversine_value
    end
end

def check_carpark_params
    unless params[:latitude] && params[:longitude]
        return head(:bad_request)
    end
end

def save_params
        @request_location=[params[:longitude].to_f,params[:latitude].to_f]
        @page = params[:page]
        @per_page = params[:per_page]
end

end