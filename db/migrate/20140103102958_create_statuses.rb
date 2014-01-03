class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status
      t.string :owner_type
      t.integer :owner_id
      t.timestamps
    end


  end
end
