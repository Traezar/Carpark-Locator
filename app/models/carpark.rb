
class Carpark < ActiveRecord::Base
    validates :car_park_no, presence: true
    validates :address, presence: true
    validates(:latitude, {presence: true, numericality: true})
    validates(:longitude, {presence: true, numericality: true})
    validates(:total_lots, {presence: true, numericality:true})
    validates(:available_lots, {presence: true, numericality: true})
end