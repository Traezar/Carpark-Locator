require 'faraday'
require 'svy21'
require_relative '../../app/models/carpark.rb'


def get_lot_info
    request = Faraday.new
    response = request.get('https://api.data.gov.sg/v1/transport/carpark-availability')
    carpark_list = JSON.parse(response.body.chomp)
end

def connect_to_database
    unless ActiveRecord::Base.connected?
        puts "Establishing connection to database"
        ActiveRecord::Base.establish_connection(
            :adapter => "mysql2",
            :username => "root",
            :password => "",
            :database => "carpark_dev")
         puts "Connection Established"
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
        latLong = SVY21.svy21_to_lat_lon(spot[2].to_f,spot[3].to_f)
        carpark = Carpark.create(
            :car_park_no => spot[0],
            :address => spot[1],
            :latitude => latLong[0],
            :longitude => latLong[1],
            :total_lots => 0,
            :available_lots => 0,
            :haversine_value => 0)
    end
    puts "Total of #{count} entries added to the database"
end
