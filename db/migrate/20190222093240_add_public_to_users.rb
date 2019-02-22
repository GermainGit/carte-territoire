class AddPublicToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :public, :boolean
  end
end
