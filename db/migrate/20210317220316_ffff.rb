class Ffff < ActiveRecord::Migration[6.1]
  def up
    rename_column :comments, :post_id, :question_id
    rename_column :comments, :parent_id, :user_id

  end
end
