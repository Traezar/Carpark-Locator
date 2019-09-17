require 'csv'
require_relative '../carpark/http_helpers.rb'

desc " Loads the CSV file into the database"
task :convert_and_store_csv do
    carparks = CSV.foreach(Rails.root.join('lib/hdb-carpark-information.csv'), headers:true)
    convert_svy21_to_latlong(carparks)
    puts "Database is now populated with carparks!"
end

desc "Gets the total and available number of lots in each carpark"
task :available_lots do
end

#{"carpark_info"=>[{"total_lots"=>"656", "lot_type"=>"C", "lots_available"=>"477"}],
# "carpark_number"=>"TPMJ", 
#"update_datetime"=>"2019-09-16T23:06:53"}
desc "Gets the total and available number of lots in each carpark"
task :total_lots do
    list = get_lot_info()
    connect_to_database()
    list["items"].first["carpark_data"].each do |key|
        cp_num = key["carpark_number"]
        cp_info = key["carpark_info"]
        total_lots = cp_info.first["total_lots"]
        available_lots = cp_info.first["lots_available"]
        carpark = Carpark.find_by(car_park_no: cp_num)
        if carpark 
            carpark.update(total_lots: total_lots , available_lots:available_lots)
            puts "The Carpark Name is: #{cp_num}, the Total Lots is : #{total_lots}, the Available is :#{available_lots}"
        else
            puts "NOTFOUND IN DATABASE!!!!!!!!: #{cp_num}, the Total Lots is : #{total_lots}, the Available is :#{available_lots}"
        end
    end
end
