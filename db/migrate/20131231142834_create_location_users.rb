class CreateLocationUsers < ActiveRecord::Migration
  def change
    create_table :location_users do |t|

      t.timestamps
    end
  end
end
