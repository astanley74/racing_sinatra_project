class CreateRacecars < ActiveRecord::Migration
  def change
    create_table :racecars do |t|
      t.string :driver_name
      t.string :number
      t.string :driver_bio
    end
  end
end
