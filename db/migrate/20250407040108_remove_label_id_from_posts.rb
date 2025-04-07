class RemoveLabelIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :label_id, :integer
  end
end
