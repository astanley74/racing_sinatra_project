class Racecar < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :car_name, :driver, :number, :driver_bio
    validates :number, uniqueness: true
end
