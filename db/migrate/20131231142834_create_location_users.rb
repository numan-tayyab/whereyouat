class CreateLocationUsers < ActiveRecord::Migration
  def change
    create_table :location_users do |t|
      t.references :user
      t.references :location
      t.timestamps
    end
  end
end
