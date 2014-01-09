class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :status
      t.date :dob
      t.integer :user_id
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.timestamps
    end
  end
end
