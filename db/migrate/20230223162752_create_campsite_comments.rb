class CreateCampsiteComments < ActiveRecord::Migration[6.1]
  def change
    create_table :campsite_comments do |t|
      
      t.integer :campsite_id, null: false
      t.integer :user_id, null: false
      t.text :campsite_comment, null: false

      t.timestamps
    end
  end
end
