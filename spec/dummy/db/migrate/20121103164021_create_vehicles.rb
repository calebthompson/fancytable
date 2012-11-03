class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|

      t.timestamps
    end
  end
end
