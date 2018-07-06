class AddStatusToPosts < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :status, :string
  end

  def down
    remove_column :posts, :status
  end
end
