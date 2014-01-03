class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :status
      t.date :dob
      t.integer :user_id
      t.timestamps
    end
  end
end
