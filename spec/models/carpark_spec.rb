require 'rails_helper'

#context and describe are aliases of each other. cool
RSpec.describe Carpark, type: :model do
  context 'validation tests' do
    it 'Ensures Carpark number is present' do
      carpark = Carpark.new(latitude:'1',longitude:'1', total_lots: '1', available_lots:'1').save
      expect(carpark).to eq(false)
    end
    it 'Ensures Latitude is present' do
      carpark = Carpark.new(car_park_no:'1',longitude:'1', total_lots: '1', available_lots:'1').save
      expect(carpark).to eq(false)
    end
    it 'Ensures Longtitude  is present' do
      carpark = Carpark.new(car_park_no: '1' ,latitude:'1', total_lots: '1', available_lots:'1').save
      expect(carpark).to eq(false)
    end
    it 'Ensures Available_lot is present' do
      carpark = Carpark.new(latitude:'1',longitude:'1', total_lots: '1', car_park_no: '1').save
      expect(carpark).to eq(false)
    end
    it 'Ensures Total lot is present' do
      carpark = Carpark.new(latitude:'1',longitude:'1', car_park_no: '1', available_lots:'1').save
      expect(carpark).to eq(false)
    end
  end
end
