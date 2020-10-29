class ChangeDatatypeForNumber < ActiveRecord::Migration
  def change
    change_column :racecars, :number, :integer
  end
end
