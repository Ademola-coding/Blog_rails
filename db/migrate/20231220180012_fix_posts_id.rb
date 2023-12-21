class FixPostsId < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:likes, :post_id)
      rename_column :likes, :posts_id, :post_id
      rename_column :comments, :posts_id, :post_id
    end
  end
end
