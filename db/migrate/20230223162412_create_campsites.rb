class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      
    t.integer :user_id, null: false
    t.string :title, null: false, default: ""
    t.text :opinion, null: false
    t.string :campsite_name
    t.integer :facility, null: false, default: 0
    t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
