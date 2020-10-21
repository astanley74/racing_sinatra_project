class CreateRacecars < ActiveRecord::Migration
  def change
    create_table :racecars do |t|
      t.string :car_name
      t.string :driver
      t.string :number
      t.string :driver_bio
    end
  end
end