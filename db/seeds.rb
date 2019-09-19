require_relative '../lib/carpark/http_helpers.rb'

carparks = CSV.foreach(Rails.root.join('lib/hdb-carpark-information.csv'), headers:true)
convert_svy21_to_latlong(carparks)
puts "Database is now populated with carparks!"
