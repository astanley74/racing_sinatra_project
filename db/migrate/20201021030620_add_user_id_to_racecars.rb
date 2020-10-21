class AddUserIdToRacecars < ActiveRecord::Migration
  def change
    add_column :racecars, :user_id, :integer
  end
end
