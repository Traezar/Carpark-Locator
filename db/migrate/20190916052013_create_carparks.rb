class CreateCarparks < ActiveRecord::Migration[6.0]
  def change
    create_table :carparks do |t|
      t.string :car_park_no , primary: true
      t.text :address
      t.string :latitude
      t.string :longitude
      t.string :total_lots
      t.string :available_lots
    end
  end
end
