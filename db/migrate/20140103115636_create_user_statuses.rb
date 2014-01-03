class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.references :status
      t.integer :user_id
      t.string :user_response
      t.timestamps
    end
  end
end
