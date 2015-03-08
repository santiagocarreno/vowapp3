class AddUColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :is_foundation, :boolean
    add_column :users, :photo_url, :string
    add_column :users, :description, :string
    add_column :users, :categories, :string
  end
end
