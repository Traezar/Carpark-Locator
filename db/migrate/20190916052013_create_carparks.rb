class CreateCarparks < ActiveRecord::Migration[6.0]
  def change
    create_table :carparks do |t|
      t.string :car_park_no , primary: true
      t.text :address
      t.decimal :precision=>64, :scale=>12  :latitude
      t.decimal :precision=>64, :scale=>12  :longitude
      t.integer :total_lots
      t.integer :available_lots
      t.decimal :precision=>64, :scale=>12  :haversine_value
    end
  end
end
