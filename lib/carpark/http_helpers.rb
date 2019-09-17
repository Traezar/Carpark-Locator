require 'faraday'
require_relative '../../app/models/carpark.rb'
def construct_request_for_carpark_info(params)
    x_svy21 = params[2]
    y_svy21= params[3]
    request = "https://developers.onemap.sg/commonapi/convert/3414to4326?X=#{x_svy21}&Y=#{y_svy21}"
end

def get_lot_info
    request = Faraday.new
    response = request.get('https://api.data.gov.sg/v1/transport/carpark-availability')
    carpark_list = JSON.parse(response.body.chomp)
end

def connect_to_database
    unless ActiveRecord::Base.connected?
        puts "establishing connection to database"
        ActiveRecord::Base.establish_connection(
            :adapter => "mysql2",
            :username => "root",
            :password => "",
            :database => "carpark_dev")
    else
        puts "Database is already connected"
    end
end

def convert_svy21_to_latlong(carparks)
    conn = Faraday.new
    count = 0
    connect_to_database()
    carparks.each do |spot|
        count += 1
        request = construct_request_for_carpark_info(spot)
        response = conn.get(request)
        latLong= JSON.parse(response.body.chomp)
        carpark = Carpark.create(
            :car_park_no => spot[0],
            :address => spot[1],
            :latitude => latLong["latitude"],
            :longitude => latLong["longitude"],
            :total_lots => 0,
            :available_lots => 0)
    end
    puts "total of #{count} entries added"
end
