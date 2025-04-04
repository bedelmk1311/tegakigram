class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.text :body, null:false
      t.integer :label_id, null:false
      
      t.timestamps
    end
  end
end
