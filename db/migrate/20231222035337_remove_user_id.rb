class RemoveUserId < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :user_id, :integer
  end
end
